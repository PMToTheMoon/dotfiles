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
  RepositoryReactiveItem({
    required this.dataName,
    required this.dataType,
    required this.name,
  });
  final String dataName;
  final Reference dataType;

  @override
  final String name;

  String get _dataCache => '_$dataName';

  String get _dataStreamController => '_${dataName}StreamController';

  @override
  Iterable<Field> get fields => [
        field(_dataCache, dataType),
        _streamControllerField,
      ];

  @override
  Iterable<Method> get methods => [
        getter(
          '${dataName}Stream',
          refer('Stream<${dataType.symbol}>'),
          refer('_${dataName}StreamController.stream').code,
        ),
        getter(dataName, dataType, refer(_dataCache).code),
        setter(
            dataName,
            dataType,
            Block.of([
              Code('$_dataCache = value;'),
              Code('$_dataStreamController.add(value);')
            ]),
            lambda: false),
      ];

  @override
  RepositorySource meta(Reference repository) =>
      RepositoryStreamSourceImpl(repository);

  Field get _streamControllerField {
    final type = TypeReference((t) => t
      ..types.addAll([dataType])
      ..symbol = 'StreamController'
      ..url = 'dart:async');
    return field(
      _dataStreamController,
      type,
      late: true,
      assignment: type.newInstanceNamed('broadcast', []).code,
    );
  }
}
