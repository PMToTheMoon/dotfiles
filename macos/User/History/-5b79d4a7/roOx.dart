import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:meta_proj/src/fetch_bloc.dart';
import 'package:meta_proj/src/model.dart';
import 'package:meta_proj/src/repo.dart';

void main() {
  build(
    Path('lib', [
      // MyModel(),
      // RecordsBloc(),
      Compose(),
    ]),
  );
}

class UserRepository extends Seed<RepositoryMetaData> {
  @override
  grow(BuildContext context) {
    return TbtRepository(
      subject: 'user',
      items: [
        TbtRepositoryFutureItem(
          client: 'user',
          name: 'updateAccountInformation',
          error: 'unable to fetch user account',
          returns: refer('Future<void>'),
          parameters: {
            param('id', refer('String')),
            param('update', refer('UserAccountInformationUpdate')),
          },
        ),
        TbtRepositoryFutureItem(
          client: 'listUserByName',
          name: 'getUserName',
          error: 'unable to fetch user name',
          returns: refer('Future<String>'),
          parameters: {
            param('id', refer('String')),
          },
        ),
        TbtRepositoryReactiveItem(
          name: 'jobList',
          dataName: 'jobs',
          dataType: refer('List<Job>'),
        ),
      ],
    );
  }
}

class UserBloc extends Seed<void> {
  UserBloc({required this.source});

  final RepositoryFutureSource source;

  @override
  MetaObject grow(BuildContext context) {
    return ParametrizedFetchBloc(
      subject: 'user',
      source: Source.fromRepositoryFutureSource(source),
    );
  }
}

class Compose extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    final userRepoMeta = context.build(UserRepository());
    return UserBloc(source: userRepoMeta.source('getUserName'));
  }
}
