part of 'contact_bloc.dart';

@freezed
class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState.waitingSubmission() =
      ContactStateWaitingSubmission;
  const factory ContactState.sending({
    String message,
  }) = ContactStateSending;
  const factory ContactState.success() = ContactStateSuccess;
  const factory ContactState.error() = ContactStateError;
}
