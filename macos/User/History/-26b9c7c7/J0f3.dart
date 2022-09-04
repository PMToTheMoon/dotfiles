import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

import 'repository_source.dart';

abstract class RepositoryItem {
  String get name;
  Iterable<Method> get methods;
  Iterable<Field> get fields;
  RepositorySource meta(RepositoryMetaData metaData);
}

class RepositoryFetchable extends RepositoryItem {
  RepositoryFetchable({
    required this.name,
    required this.fetchData,
    this.dataName = 'data',
  });

  final String name;
  final String dataName;
  final Method fetchData;

  @override
  Iterable<Field> get fields => [];

  @override
  Iterable<Method> get methods => [fetchMethod];

  @override
  RepositorySource meta(RepositoryMetaData metaData) =>
      RepositoryFutureSourceImpl(fetchMethod);

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

// class StreamRepositorySource extends RepositorySource {
//   final Field data;

//   @override
//   // TODO: implement fields
//   Iterable<Fields> get fields => throw UnimplementedError();

//   @override
//   // TODO: implement methods
//   Iterable<Method> get methods => throw UnimplementedError();
// }
