import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

abstract class RepositoryItem {
  String get name;
  Iterable<Method> get methods;
  Iterable<Field> get fields;
  RepositorySource meta(Reference repository);
}

class RepositoryFetchable extends RepositoryItem {
  RepositoryFetchable({
    required this.name,
    required this.fetchData,
    this.dataName = 'data',
  });

  @override
  final String name;

  final String dataName;
  final Method fetchData;

  @override
  Iterable<Field> get fields => [];

  @override
  Iterable<Method> get methods => [fetchMethod];

  @override
  RepositorySource meta(Reference repository) =>
      RepositoryFutureSourceImpl(repository, fetchMethod);

  Method get fetchMethod {
    return Method(
      (m) => m
        ..name = name
        ..returns = fetchData.returns
        ..modifier = MethodModifier.async
        ..requiredParameters.addAll(fetchData.requiredParameters)
        ..optionalParameters.addAll(fetchData.optionalParameters)
        ..body = _fetchMethodBody(),
    );
  }

  Block _fetchMethodBody() {
    return Block.of([
      declareFinal('data').assign(fetchData.call().awaited).statement,
      refer('data').returned.statement,
    ]);
  }
}

class RepositoryReactiveItem extends RepositoryItem {
  final String dataName;
  final Reference dataType;

  RepositoryReactiveItem(this.dataName, this.dataType);

  String get _dataCache => '_$dataName';

  @override
  Iterable<Field> get fields => [
        field(_dataCache, dataType),
        _streamControllerField,
      ];

  @override
  Iterable<Method> get methods => [
        getter(dataName, dataType, refer(_dataCache)),
        getter(
          '${dataName}Stream',
          refer('Stream<$dataType>'),
          refer('_${dataName}StreamController.stream'),
        )
      ];

  @override
  final String name;

  @override
  RepositorySource meta(Reference repository) => [];

  Field get _streamControllerField {
    final type = TypeReference((t) => t
      ..types.addAll([dataType])
      ..symbol = 'StreamController'
      ..url = 'dart:async');
    return field(
      '_${dataName}StreamController',
      type,
      late: true,
      assignment: type.newInstanceNamed('broadcast', []).statement,
    );
  }
}
