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

  String get _dataCache => '_$dataName';

  @override
  Iterable<Field> get fields => [
        field(_dataCache, dataType),
      ];

  @override
  // TODO: implement methods
  Iterable<Method> get methods => [
        getter(dataName, dataType, refer(_dataCache)),
      ];

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  RepositorySource meta(Reference repository) {
    throw UnimplementedError();
  }

  Field get _streamControllerField {
    return field(
      '_${dataName}StreamController',
      refer('symbol'),
      late: true,
      assignment: refer(symbol),
    );
  }
}
