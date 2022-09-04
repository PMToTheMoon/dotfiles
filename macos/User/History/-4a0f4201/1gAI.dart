import 'package:app_client/auth/auth.dart';
import 'package:app_client/sign_in/sign_in.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'code_bloc.freezed.dart';
part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends StateMachine<CodeEvent, CodeState> {
  CodeBloc({
    required this.formData,
    required this.authRepository,
  }) : super(const CodeState.waitingSubmission()) {
    define<CodeSending>(
      ($) => $
        ..onEnter(_sendCode)
        ..on<CodeSent>(_transitToWaitingSubmission),
    );

    define<CodeWaitingSubmission>(
      ($) => $
        ..onEnter(_sendCode)
        ..on<CodeSubmitted>(_transitToCodeSubmitting),
    );

    define<CodeSubmitting>(($) => $
      ..onEnter(_submitCode)
      ..on<CodeValidated>(_transitToCodeSuccess)
      ..on<CodeRefused>(_transitToCodeInvalid));

    define<CodeInvalid>();

    define<CodeSuccess>();
  }

  final SignInFormData formData;
  final AuthRepository authRepository;

  CodeWaitingSubmission _transitToWaitingSubmission(
    CodeSent event,
    CodeState _,
  ) =>
      CodeWaitingSubmission(codeHash: event.codeHash);

  CodeSubmitting _transitToCodeSubmitting(
    CodeSubmitted event,
    CodeWaitingSubmission state,
  ) =>
      CodeSubmitting(code: event.code, codeHash: state.codeHash);

  CodeSuccess _transitToCodeSuccess(CodeValidated event, _) =>
      const CodeSuccess();

  CodeInvalid _transitToCodeInvalid(CodeRefused event, _) =>
      const CodeInvalid();

  Future<void> _sendCode(_) async {
    try {
      final hash =
          await authRepository.sendSmsCode(phoneNumber: formData.phoneNumber);
    } catch (e) {
      add(const CodeEvent.codeRefused());
    }
  }

  Future<void> _submitCode(CodeSubmitting state) async {
    try {
      // await authRepository.sendSmsCode(phoneNumber: state.code);
      await authRepository.signin(
          data: SignInRequest(
              firstName: formData.firstName,
              lastName: formData.lastName,
              email: formData.email,
              phoneNumber: formData.phoneNumber,
              password: formData.password,
              code: state.code,
              codeHash: state.codeHash));
      add(const CodeEvent.codeValidated());
    } catch (e) {
      add(const CodeEvent.codeRefused());
    }
  }
}
