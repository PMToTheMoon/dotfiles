import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {}

abstract class RepositoryFutureSource implements RepositorySource {
  Method get method;
}

abstract class RepositoryFutureSourceImpl implements RepositoryFutureSource {
  RepositoryFutureSourceImpl(this.method);
  @override
  final Method method;
}
