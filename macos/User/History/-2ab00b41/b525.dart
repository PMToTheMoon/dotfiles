part of 'user_personal_information_bloc.dart';

@freezed
class UserPersonalInformationEvent with _$UserPersonalInformationEvent {
  const factory UserPersonalInformationEvent.started({
    required UserAccountInformationUpdate update,
  }) = UserPersonalInformationStarted;
  const factory UserPersonalInformationEvent.formSubmitted() =
      UserPersonalInformationFormSubmitted;
}
