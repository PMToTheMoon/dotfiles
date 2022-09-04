part of 'code_bloc.dart';

@freezed
abstract class CodeEvent {
  const factory CodeEvent.codeSent({
    required String codeHash,
  }) = CodeSent;
  const factory CodeEvent.codeSent({
    required String codeHash,
  }) = CodeSent;
  const factory CodeEvent.codeSubmitted({
    required String code,
  }) = CodeSubmitted;
  const factory CodeEvent.codeValidated() = CodeValidated;
  const factory CodeEvent.codeRefused() = CodeRefused;
}
