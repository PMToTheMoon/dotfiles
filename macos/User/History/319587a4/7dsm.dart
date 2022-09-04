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
        ..._builderParametersFromBloc(bloc),
      ]));
  }

  Iterable<Field> _buildFields() {
    return [
      ..._listenerFieldsFromBloc(bloc),
      ..._builderFieldsFromBloc(bloc),
    ];
  }

  Method _buildBuildMethod() {
    const body = '''
return  BlocConsumer<SubjectBloc, SubjectState>(
  listener: (context, state) {
    state.map(
      loading: (s) => onLoading?.call(context, s),
      success: (s) => onSuccess?.call(context, s),
      error: (s) => onError?.call(context, s),
    )
  },
  builder: (context, state) {
    return state.map(
      initial: (s) => initial(context, s),
      loading: (s) => loading(context, s),
      success: (s) => success(context, s),
      error: (s) => error(context, s),
    );
  },
);''';

    return Method(
      (m) => m
        ..name = 'build'
        ..requiredParameters.add(funcParam(
          'context',
          refer('BuildContext', 'package:flutter/material.dart'),
        ))
        ..returns = refer('Widget', 'package:flutter/material.dart')
        ..annotations.add(refer('override'))
        ..body = const Code(body),
    );
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
          'Widget Function(BuildContext context, ${state.$class.name})',
          state.reference.url,
        ),
      ),
  });
}
