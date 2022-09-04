import 'package:bonemeal/bonemeal.dart';

import 'login_form.dart';
import 'sign_in_form.dart';

final auth = Path('auth/', [
  Path('sign_in/widgets', [
    signInFormController,
  ]),
  Path('login/widgets', [
    loginFormController,
  ]),
]);
