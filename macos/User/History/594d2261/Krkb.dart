import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'auth/auth.dart';

Future<void> main() async {
  buildAll(<MetaObject>[
    Path('lib/', [
      auth,
    ]),
  ]);
}
