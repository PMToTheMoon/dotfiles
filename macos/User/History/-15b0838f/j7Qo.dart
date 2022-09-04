import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {
  const RepositorySource(this.repository);
  final Reference repository;
}

abstract class RepositoryFetchableSource implements RepositorySource {
  Method get fetch;
}

abstract class RepositoryStreamSource implements RepositorySource {
  // Method get method;
}

class RepositoryFutureSourceImpl extends RepositorySource
    with RepositoryFetchableSource {
  RepositoryFutureSourceImpl(
    super.repository,
    this.method,
  );

  @override
  final Method method;
}

class RepositoryStreamSourceImpl extends RepositorySource
    with RepositoryStreamSource {
  RepositoryStreamSourceImpl(
    super.repository,
  );
}
