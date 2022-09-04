import 'sign_in_form_controller.dart';

export 'sign_in_form_controller.dart';
export 'sign_in_form_snapshot.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.controller,
  });

  final SignInFormController controller;

  @override
  Widget build(BuildContext context) {
    return const Text('SignInFor');
  }
}
