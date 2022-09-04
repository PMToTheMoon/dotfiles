import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'auth/login_form.dart';

Future<void> main() async {
  buildAll(<MetaObject>[
    Path('lib/', [
      loginFormController,
    ]),
  ]);
}
