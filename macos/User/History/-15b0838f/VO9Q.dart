import 'package:bonemeal/bonemeal.dart';

/// Meta data constructed from items
abstract class RepositorySource {
  const RepositorySource(this.repository);
  final Reference repository;
}

mixin RepositoryFetchableSource on RepositorySource {
  Method get fetch;

  Parameter toParameter() => param(owner.symbol!.camelCase, owner);
  Expression call({ValueResolver? values}) => method.call(
        owner: owner.symbol?.camelCase,
        values: values,
      );
}

abstract class RepositoryStreamSource implements RepositorySource {
  // Method get method;
}

class RepositoryFutureSourceImpl extends RepositorySource
    with RepositoryFetchableSource {
  RepositoryFutureSourceImpl(
    super.repository,
    this.fetch,
  );

  @override
  final Method fetch;
}

class RepositoryStreamSourceImpl extends RepositorySource
    with RepositoryStreamSource {
  RepositoryStreamSourceImpl(
    super.repository,
  );
}
