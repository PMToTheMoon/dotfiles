import 'package:app_client/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'code_bloc.freezed.dart';
part 'code_event.dart';
part 'code_state.dart';

class CodeBloc extends StateMachine<CodeEvent, CodeState> {
  CodeBloc({
    required this.authRepository,
  }) : super(const CodeState.waitingSubmission()) {
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

  final AuthRepository authRepository;

  CodeSubmitting _transitToCodeSubmitting(
    CodeSubmitted event,
    CodeState _,
  ) =>
      CodeSubmitting(code: event.code);

  CodeSuccess _transitToCodeSuccess(CodeValidated event, _) =>
      const CodeSuccess();

  CodeInvalid _transitToCodeInvalid(CodeRefused event, _) =>
      const CodeInvalid();

  Future<void> _submitCode(CodeSubmitting state) async {
    try {
      await authRepository.sendSmsCode(phoneNumber: state.code);
      add(const CodeEvent.codeValidated());
    } catch (e) {
      add(const CodeEvent.codeRefused());
    }
  }
}
