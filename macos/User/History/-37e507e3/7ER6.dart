import 'package:bonemeal/bonemeal.dart';

import 'login_form.dart';
import 'sign_in_form.dart';

final auth = Path('auth/', [
  // Sign in
  Path('sign_in/widgets/sign_in_form', [
    signInFormController,
  ]),
  //Login
  Path('login/widgets/login_form', [
    loginFormController,
  ]),
]);
