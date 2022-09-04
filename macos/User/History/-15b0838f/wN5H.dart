import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {
  // const RepositorySource(this.repository);
  Reference get repository;
}

abstract class RepositoryFutureSource with RepositorySource {
  Method get method;
}

class RepositoryFutureSourceImpl implements RepositoryFutureSource {
  RepositoryFutureSourceImpl(
    this.repository,
    this.method,
  );

  @override
  final Reference repository;

  @override
  final Method method;
}
