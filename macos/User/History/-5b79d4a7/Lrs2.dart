import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:meta_proj/src/fetch_bloc.dart';
import 'package:meta_proj/src/model.dart';
import 'package:meta_proj/src/repo.dart';

void main() {
  build(
    Path('lib', [
      MyModel(),
      RecordsBloc(),
      
    ]),
  );
}

class UserRepository extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return TbtRepository(
      subject: 'user',
      items: [
        TbtRepositoryItem(
          client: 'userApi',
          name: 'updateAccountInformation',
          error: 'unable to fetch user account',
          type: refer('void'),
          parameters: {
            param('id', refer('String')),
            param('update', refer('UserAccountInformationUpdate')),
          },
        )
      ],
    );
  }
}

class UserBloc extends Seed {
  UserBloc({required this.source});

  final RepositoryFutureSource source;

  @override
  MetaObject grow(BuildContext context) {
    return SimpleFetchBloc(subject: subject, source: source,);
  }
}

class Compose extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    final userRepoMeta = context.build(UserRepository());
    final userBloc = User
    throw UnimplementedError();
  }
}
