import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'api_models/api_models.dart';
import 'auth/auth.dart';
import 'models/models.dart';
import 'user_account/user_account.dart';

Future<void> main() async {
  build(TbtApp());
}

class TbtApp extends Seed {
  @override
  MetaObject grow(BuildContext context) {
    return Seeds([
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
}
