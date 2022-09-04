import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

import 'tbt_repo.dart';

class UserRepository extends Seed<RepositoryMetaData> {
  @override
  grow(BuildContext context) {
    return TbtRepository(
      subject: 'user',
      items: [
        // TbtRepositoryFutureItem(
        //   client: 'user',
        //   name: 'updateAccountInformation',
        //   error: 'unable to fetch user account',
        //   returns: refer('Future<void>'),
        //   parameters: {
        //     param('id', refer('String')),
        //     param('update', refer('UserAccountInformationUpdate')),
        //   },
        // ),
        // TbtRepositoryReactiveItem(
        //   client: 'candidate',
        //   name: 'jobList',
        //   dataName: 'jobs',
        //   dataType: refer('List<Job>'),
        // ),
        TbtRepositoryFutureItem(
          client: 'user',
          name: 'getUserName',
          error: 'unable to fetch user name',
          returns: refer('Future<String>'),
          parameters: {
            funcParam('id', refer('String')),
          },
        ),
        TbtRepositoryFutureItem(
          client: 'user',
          name: 'deleteJob',
          error: 'unable to delete user job',
          returns: refer('Future<void>'),
          parameters: {
            funcParam('jobId', refer('String')),
          },
        ),
      ],
    );
  }
}

class UserBloc extends Seed<void> {
  UserBloc({required this.source});

  final RepositoryFetchableSource source;

  @override
  MetaObject grow(BuildContext context) {
    return TripleStateBloc(
      subject: 'user',
      source: source,
      sourceImmutableParameters: {'id'},
    );
  }
}

class DeleteUserJobBloc extends Seed<void> {
  DeleteUserJobBloc({required this.userRepo});

  final RepositoryMetaData userRepo;

  @override
  MetaObject grow(BuildContext context) {
    return TripleStateBloc(
      subject: 'deleteUserJob',
      source: userRepo.sources['deleteJob'] as RepositoryFetchableSource,
      sourceImmutableParameters: {'jobId'},
    );
  }
}

class RepoTest extends MetaObject {
  @override
  MetaObject grow(BuildContext context) {
    final userRepoMeta = context.build(UserRepository());
    // return UserBloc(source: userRepoMeta.source('getUserName'));
    final blocMeta = 
    return DeleteUserJobBloc(userRepo: userRepoMeta);
  }
  
  @override
  build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
  @override
  String get path => '';
}
