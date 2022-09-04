part of 'user_account_bloc.dart';

@freezed
class UserAccountEvent with _$UserAccountEvent {
  const factory UserAccountEvent.started() = UserAccountStarted;

  const factory UserAccountEvent.informationEdited({
    required UserAccountInformationUpdate update,
  }) = UserAccountEventInformationEdited;
}
