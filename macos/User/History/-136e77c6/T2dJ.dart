import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'api_models/api_models.dart';
import 'auth/auth.dart';
import 'models/models.dart';
import 'user_account/user_account.dart';

Future<void> main() async {
  buildAll(<MetaObject>[
    Path('lib/', [
      auth,
      user,
    ]),
    Path('packages/models/lib/', [
      models,
    ]),
    apiModels,
  ]);
}

class TbtApp extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    Path('lib/', [
      auth,
      user,
    ]),
    Path('packages/models/lib/', [
      models,
    ]),
    apiModels,
  }
}
