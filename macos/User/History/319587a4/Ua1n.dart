import 'package:bloc_generators/bloc_generators.dart';
import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:collection/collection.dart';

class TripleBlocConsumer extends MetaObject {
  TripleBlocConsumer(this.bloc);

  final TripleStateBlocMeta bloc;

  String get className => '${bloc.$class.name}Consumer';

  @override
  String get path => '${className.snakeCase}.dart';

  @override
  build(BuildStep step) {
    final $class = Class(
      (c) => c
        ..name = className
        ..extend = refer('StatelessWidget', 'package:flutter/material.dart')
        ..constructors.add(_buildConstructor())
        ..fields.addAll(_buildFields()),
    );
    step.emit(Library((l) => l..body.add($class)));
  }

  Constructor _buildConstructor() {
    return Constructor((c) => c
      ..optionalParameters.addAll([
        ..._listenerParametersFromBloc(bloc),
        // ..._buildersParametersFromBloc(bloc),
      ]));
  }

  Iterable<Field> _buildFields() {
    return [
      ..._listenerFieldsFromBloc(bloc),
    ];
  }
}

Iterable<FreezedTypeMetaData> _allStatesExceptInitial(
    Iterable<FreezedTypeMetaData> states) {
  return states.whereNot(
    (s) => s.name == 'initial',
  );
}

Parameters _listenerParametersFromBloc(TripleStateBlocMeta bloc) {
  return Parameters({
    for (final state in _allStatesExceptInitial(bloc.states.types.values))
      namedParam('on${state.name.pascalCase}'),
  });
}

Fields _listenerFieldsFromBloc(TripleStateBlocMeta bloc) {
  return Fields({
    for (final state in _allStatesExceptInitial(bloc.states.types.values))
      field(
        'on${state.name.pascalCase}',
        refer(
          'void Function(BuildContext context, ${state.$class.name})?',
          state.reference.url,
        ),
      ),
  });
}

Parameters _builderParametersFromBloc(TripleStateBlocMeta bloc) {
  return Parameters({
    for (final state in bloc.states.types.values)
      namedParam(state.name.camelCase),
  });
}

Fields _builderFieldsFromBloc(TripleStateBlocMeta bloc) {
  return Fields({
    for (final state in bloc.states.types.values)
      field(
        state.name.camelCase,
        refer(
          'Widget Function(BuildContext context, ${state.$class.name})?',
          state.reference.url,
        ),
      ),
  });
}
