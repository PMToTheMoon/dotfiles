import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'auth/auth.dart';
import 'candidate/candidate.dart';
import 'models/models.dart';

Future<void> main() async {
  var user;
  buildAll(<MetaObject>[
    Path('lib/', [
      auth,
      user,
    ]),
    Path('packages/models/lib/', [
      models,
    ])
  ]);
}
