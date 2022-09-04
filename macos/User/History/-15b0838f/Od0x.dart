import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {
  const RepositorySource(this.repository, this.method);
  final Reference repository;
  final Method method;
}

abstract class RepositoryFutureSource implements RepositorySource {}

class RepositoryFutureSourceImpl extends RepositorySource
    with RepositoryFutureSource {
  RepositoryFutureSourceImpl(super.repository, super.method);
}
