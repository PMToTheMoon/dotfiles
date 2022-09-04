import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

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
        ..constructors.add(_buildConstructor()),
    );
  }

  Constructor _buildConstructor() {
    return Constructor((c) => c
      ..optionalParameters.addAll([
        ..._listenerParametersFromBloc(bloc),
        ..._buildersParametersFromBloc(bloc),
      ]));
  }
}

Parameters _listenerParametersFromBloc(TripleStateBlocMeta bloc) {
  return Parameters({
    for (final state in bloc.states.types.values)
      param(
        'on${state.name}',
        required: true,
        named: true,
      )
  });
}

Parameters _buildersParametersFromBloc(TripleStateBlocMeta bloc) {
  return Parameters({
    for (final state in bloc.states.types.values)
      param(state.name, state.reference, required: true, named: true)
  });
}

// Parameters _buildersParametersFromBloc(TripleStateBlocMeta bloc) {
//   return Parameters({
//     for (final state in bloc.states.types.values)
//       param(state.name, state.reference, required: true, named: true)
//   });
