part of 'contact_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState.waitingSubmission() = _ContactState;
  const factory ContactState.sending() = _ContactState;
  const factory ContactState.success() = _ContactState;
  const factory ContactState.error() = _ContactState;
}