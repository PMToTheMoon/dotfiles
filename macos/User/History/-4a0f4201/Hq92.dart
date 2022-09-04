import 'package:app_client/auth/auth.dart';
import 'package:app_client/sign_in/sign_in.dart';
import 'package:app_client/urban_driver_api/clients/urban_driver_api_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'code_bloc.freezed.dart';
part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends StateMachine<CodeEvent, CodeState> {
  CodeBloc({
    required this.formData,
    required this.authRepository,
  }) : super(const CodeState.sendingCode()) {
    define<CodeSending>(
      ($) => $
        ..onEnter(_sendCode)
        ..on<CodeSent>(_transitToWaitingSubmission)
        ..on<CodeFailedSend>(_transitToCodeSendError),
    );

    define<CodeSendError>();

    define<CodeWaitingSubmission>(
      ($) => $..on<CodeSubmitted>(_transitToCodeSubmitting),
    );

    define<CodeSubmitting>(($) => $
      ..onEnter(_submitCode)
      ..on<CodeValidated>(_transitToSignInSuccess)
      ..on<CodeRefused>(_transitToCodeInvalid)
      ..on<CodeSignInFailed>(_transitToSignInError));

    define<CodeInvalid>(
      ($) => $
        ..on<CodeSubmitted>((e, s) => CodeSubmitting(
              code: e.code,
              codeHash: s.codeHash,
            )),
    );

    define<CodeSignInError>();

    define<CodeSignInSuccess>(($) => $
      ..onEnter(_login)
      ..on<CodeLogInSucceed>(_transitToLogInSuccess)
      ..on<CodeLogInFailed>(_transitToLogInError));

    define<CodeLogInError>();
    define<CodeLogInSuccess>();
  }

  final SignInFormData formData;
  final AuthRepository authRepository;

  CodeWaitingSubmission _transitToWaitingSubmission(
    CodeSent event,
    CodeState _,
  ) =>
      CodeWaitingSubmission(codeHash: event.codeHash);

  CodeSendError _transitToCodeSendError(e, s) => const CodeSendError();

  CodeSubmitting _transitToCodeSubmitting(
    CodeSubmitted event,
    CodeWaitingSubmission state,
  ) =>
      CodeSubmitting(code: event.code, codeHash: state.codeHash);

  CodeSignInSuccess _transitToSignInSuccess(CodeValidated event, _) =>
      const CodeSignInSuccess();

  CodeInvalid _transitToCodeInvalid(e, CodeSubmitting s) =>
      CodeInvalid(codeHash: s.codeHash);

  CodeSignInError _transitToSignInError(CodeSignInFailed event, _) =>
      CodeSignInError(reason: event.reason);

  CodeLogInError _transitToLogInError(e, s) => const CodeLogInError();

  CodeLogInSuccess _transitToLogInSuccess(e, s) => const CodeLogInSuccess();

  Future<void> _sendCode(_) async {
    try {
      final hash = await authRepository.sendSmsCode(
        phoneNumber: formData.phoneNumber,
      );
      add(CodeSent(codeHash: hash));
    } catch (e) {
      add(const CodeFailedSend(error: "unknown"));
    }
  }

  Future<void> _submitCode(CodeSubmitting state) async {
    try {
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
    } on InvalidCode {
      add(const CodeEvent.codeRefused());
    } catch (e) {
      final reason =
          e is EmailExist ? SignInFailure.EmailExist : SignInFailure.Unknown;

      add(CodeEvent.signInFailed(
        reason: reason,
      ));
    }
  }

  Future<void> _login(CodeSignInSuccess state) async {
    try {
      await authRepository.login(
        email: formData.email,
        password: formData.password,
      );
      add(const CodeEvent.logInSucceed());
    } catch (e) {
      add(const CodeEvent.logInFailed());
    }
  }
}
