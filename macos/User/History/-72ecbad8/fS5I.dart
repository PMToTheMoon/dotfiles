part of 'user_personal_information_bloc.dart';

@freezed
class UserPersonalInformationState with _$UserPersonalInformationState {
  const factory UserPersonalInformationState.initial() =
      UserPersonalInformationInitial;
  const factory UserPersonalInformationState.updating() =
      UserPersonalInformationUpdating;
  const factory UserPersonalInformationState.success() =
      UserPersonalInformationSuccess;
  const factory UserPersonalInformationState.error() =
      UserPersonalInformationError;
}
