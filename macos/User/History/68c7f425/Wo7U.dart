import 'package:flutter/material.dart';

import '../login_form_snapshot.dart';

class LoginFormController {
  LoginFormController({String? email, String? password})
      : email = TextEditingController(text: email),
        password = TextEditingController(text: password);

  LoginFormController.fromSnapshot(LoginFormSnapshot? initialValue)
      : email = TextEditingController(text: initialValue?.email),
        password = TextEditingController(text: initialValue?.password);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController email;

  final TextEditingController password;

  bool validate() => formKey.currentState!.validate();
  LoginFormSnapshot snapshot() =>
      LoginFormSnapshot(email: email.text, password: password.text);
}
