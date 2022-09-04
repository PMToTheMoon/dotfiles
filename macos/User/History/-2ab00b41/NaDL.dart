part of 'user_personal_information_bloc.dart';

@freezed
class UserPersonalInformationEvent with _$UserPersonalInformationEvent {
  const factory UserPersonalInformationEvent.started() =
      UserPersonalInformationStarted;

  const factory UserPersonalInformationEvent.formSubmitted({
    required UserAccountInformationUpdate update,
  }) = UserPersonalInformationFormSubmitted;
}
