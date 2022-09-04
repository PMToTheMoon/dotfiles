import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {
  const RepositorySource(this.repository);
  final Reference repository;
}

abstract class RepositoryFutureSource implements RepositorySource {
  Method get method;
}

class RepositoryFutureSourceImpl implements RepositorySource {
  RepositoryFutureSourceImpl(this.method);
  @override
  final Method method;
}
