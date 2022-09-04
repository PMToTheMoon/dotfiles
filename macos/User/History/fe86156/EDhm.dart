import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';

part 'state_definition.dart';
part 'state_definition_builder.dart';

/// {@template state_machine}
/// A Bloc that provides facilities methods to create state machines
/// {@endtemplate state_machine}
abstract class StateMachine<Event, State> extends Bloc<Event, State> {
  /// {@macro state_machine}
  StateMachine(
    State initial, {

    /// Used to change how state machine process incoming events. The default event transformer is [droppable] by default,
    /// meaning it process only one event and ignore (drop) any new events until the next event-loop iteration.
    EventTransformer<Event>? transformer,
  }) : super(initial) {
    super.on<Event>(_mapEventToState, transformer: transformer ?? droppable());
  }

  final List<Type> _definedStates = [];
  final List<_StateDefinition> _stateDefinitions = [];

  /// Register [DefinedState] as one of the allowed machine's states.
  ///
  /// Works the same way as top-level define calls.
  /// The [builder] function takes an [StateDefinitionBuilder] object as a parameter
  /// and should return it. [StateDefinitionBuilder] is used to register event
  /// handlers and side effects for the defined [NestedState].
  ///
  /// Nested states should always be sub-classes of their parent state.
  ///
  /// To enter a nested state, you should explicitly transition to it.
  /// The state machine will not consider that you've entered the child state
  /// when you transit to one of its parents.
  /// The inverse is not true the state machine considers entering a parent
  /// state if you transition to one of its nested states.
  ///
  /// There is no depth limit in state nesting but you should never define a
  /// state more than ones.
  ///
  /// Nested state's event handlers and side effects are always evaluated after
  /// parent's ones.
  ///
  /// ```dart
  /// define<ParentState>(($) => $
  ///   ..define<ChildState1>()
  ///   ..define<ChildState2>(($) => $
  ///     ..onEnter(...)
  ///     ..onChange(...)
  ///     ..onExit(...)
  ///     ..on<Event1>(...)
  ///     ..define<ChildState2.1>(($) => $
  ///       ...
  ///     ) // Child2
  ///   ) // Child1
  /// );
  /// ```
  void define<DefinedState extends State>([
    StateDefinitionBuilder<Event, State, DefinedState> Function(
      StateDefinitionBuilder<Event, State, DefinedState>,
    )?
        definitionBuilder,
  ]) {
    late final _StateDefinition definition;
    if (definitionBuilder != null) {
      definition = definitionBuilder
          .call(StateDefinitionBuilder<Event, State, DefinedState>())
          ._build();
    } else {
      definition = _StateDefinition<Event, State, DefinedState>.empty();
    }

    assert(() {
      if (_definedStates.contains(DefinedState)) {
        throw "$DefinedState defined multiple times. State should only be defined once.";
      }
      _definedStates.add(DefinedState);
      return true;
    }());

    _stateDefinitions.add(definition);

    if (state is DefinedState) {
      definition.onEnter(state);
    }
  }

  /// [on] function should not be used inside [StateMachine].
  /// Use [define] instead.
  @nonVirtual
  @protected
  @override
  void on<E extends Event>(
    EventHandler<E, State> handler, {
    EventTransformer<E>? transformer,
  }) {
    throw "Invalid use of StateMachine.on(). You should use StateMachine.define() instead.";
  }

  void _mapEventToState(Event event, Emitter emit) {
    final definition = _stateDefinitions.firstWhere((def) => def.isType(state));

    final nextState = definition.add(event, state) as State?;
    if (nextState != null) {
      emit(nextState);
    }
  }

  /// Called whenever a [change] occurs with the given [change].
  /// A [change] occurs when a new `state` is emitted.
  /// [onChange] is called before the `state` of the `cubit` is updated.
  /// [onChange] is a great spot to add logging/analytics for a specific `cubit`.
  ///
  /// **Note: `super.onChange` should always be called first.**
  /// ```dart
  /// @override
  /// void onChange(Change change) {
  ///   // Always call super.onChange with the current change
  ///   super.onChange(change);
  ///
  ///   // Custom onChange logic goes here
  /// }
  /// ```
  ///
  /// See also:
  ///
  /// * [BlocObserver] for observing [Cubit] behavior globally.
  @protected
  @mustCallSuper
  @override
  void onChange(Change<State> change) {
    super.onChange(change);
    final currentDefinition = _definition(change.currentState);
    final nextDefinition = _definition(change.nextState);
    if (currentDefinition == nextDefinition) {
      currentDefinition.onChange(change.currentState, change.nextState);
    } else {
      currentDefinition.onExit(change.currentState);
      nextDefinition.onEnter(change.nextState);
    }
  }

  _StateDefinition _definition(State state) =>
      _stateDefinitions.firstWhere((def) => def.isType(state));
}
