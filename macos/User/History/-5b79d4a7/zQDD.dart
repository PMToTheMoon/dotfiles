import 'package:bonemeal/bonemeal.dart';
import 'package:meta_proj/src/fetch_bloc.dart';
import 'package:meta_proj/src/model.dart';
import 'package:meta_proj/src/repo.dart';

void main() {
  build(
    Path('lib', [
      MyModel(),
      RecordsBloc(),
      DummyRepo(),
    ]),
  );
}

class RecordsRepository extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return TbtRepository(
      subject: 'records',
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

class Compose extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    final repo = TbtRepository(subject: 'records', items: )
    throw UnimplementedError();
  }
}