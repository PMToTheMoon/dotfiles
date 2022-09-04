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

  CodeSendError _transitToCodeSendError(e, s) => const CodeSendError();

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
      if (e is EmailExist) {
        add(const CodeEvent.signInFailed(
          reason: SignInFailure.EmailExist,
        ));
      } else {}
    }
  }
}
