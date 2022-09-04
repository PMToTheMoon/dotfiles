part of 'contact_bloc.dart';

@freezed
class ContactEvent with _$ContactEvent {
  const ContactEvent._();

  const factory ContactEvent.messageSubmitted({
    required String message,
  }) = ContactEventMessageSubmitted;
  const factory ContactEvent.successfullySubmitted() =
      ContactEventSuccessfullySubmitted;
  const factory ContactEvent.submissionFailed() = ContactEventSubmissionFailed;
}
