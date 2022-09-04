import 'package:bonemeal/bonemeal.dart';

import 'login_form.dart';
import 'sign_in_form.dart';

final auth = Path('auth/', [
  Path('sign_in/widgets/login_form', [
    signInFormController,
  ]),
  Path('login/widgets/sign_in_form', [
    loginFormController,
  ]),
]);
