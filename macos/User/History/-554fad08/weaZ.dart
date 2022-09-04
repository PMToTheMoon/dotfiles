part of 'contact_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';

@freezed
class ContactEvent with _$ContactEvent {
  const ContactEvent._();

  const factory ContactEvent.messageSubmitted() = _ContactEventMessageSubmitted;
  const factory ContactEvent.SuccessfullySubmitted() = _ContactEventSuccessfullySubmitted;
  const factory ContactEvent.success() = _ContactEventSuccessfullySubmitted;
}
