import 'package:test/test.dart';

abstract class Event {}

class EventA extends Event {}

class TriggerStateOnChange extends Event {}

abstract class State {
  @override
  bool operator ==(Object value) => false;

  @override
  int get hashCode => 0;
}

class StateA extends State {}

class StateB extends State {}

class DummyStateMachine extends StateMachine<Event, State> {
  DummyStateMachine({
    State? initialState,
  }) : super(initialState ?? AChildState1()) {
    define<ParentStateA>(
      ($) => $
        ..onEnter((_) => onEnterCalls.add("ParentStateA"))
        ..onExit((_) => onExitCalls.add("ParentStateA"))
        ..onChange((_, __) => onChangeCalls.add("ParentStateA"))

        // Child State 1
        ..define<AChildState1>(($) => $
          ..onEnter((_) => onEnterCalls.add("AChildState1"))
          ..onExit((_) => onExitCalls.add("AChildState1"))
          ..onChange((_, __) => onChangeCalls.add("AChildState1")))
        ..on<TriggerNestedStateOnEnter>((e, s) => AChildState2())
        ..on<TriggerNestedStateOnExit>((e, s) => ParentStateB())

        // Child State 2
        ..define<AChildState2>(($) => $
          ..onEnter((_) => onEnterCalls.add("AChildState2"))
          ..onExit((_) => onExitCalls.add("AChildState2"))
          ..onChange((_, __) => onChangeCalls.add("AChildState2")))
        ..on<TriggerNestedStateOnChange>((e, s) => AChildState2())

        // Child State 3
        ..define<AChildState3>(($) => $
          ..onEnter((_) => onEnterCalls.add("AChildState3"))
          ..onExit((_) => onExitCalls.add("AChildState3"))
          ..onChange((_, __) => onChangeCalls.add("AChildState3"))),
    );

    define<ParentStateB>(($) => $
      ..onEnter((_) => onEnterCalls.add("ParentStateB"))
      ..onExit((_) => onExitCalls.add("ParentStateB"))
      ..onChange((_, __) => onChangeCalls.add("ParentStateB")));
  }

  List<String> onEnterCalls = [];
  List<String> onExitCalls = [];
  List<String> onChangeCalls = [];
}

void main() {
  group("event receiving computing tests", () {});
}
