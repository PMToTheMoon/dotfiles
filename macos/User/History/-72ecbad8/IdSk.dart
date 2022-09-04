part of 'user_personal_information_bloc.dart';

@freezed
class UserPersonalInformationState with _$UserPersonalInformationState {
  const factory UserPersonalInformationState.initial() = UserPersonalInformation Initial;
  const factory UserPersonalInformationState.updating() = UserPersonalInformation Initial;
  const factory UserPersonalInformationState.success() = UserPersonalInformation Initial;
  const factory UserPersonalInformationState.error() = UserPersonalInformation Initial;
}
