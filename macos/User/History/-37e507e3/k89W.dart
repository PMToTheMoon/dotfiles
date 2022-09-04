import 'package:bonemeal/bonemeal.dart';

import 'login_form.dart';

final auth = Path('auth/', [
  Path('login/widgets', [
    loginFormController,
  ])
]);
