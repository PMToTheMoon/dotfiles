part of 'initial_observation_bloc.dart';

@freezed
class InitialObservationState with _$InitialObservationState {
  const InitialObservationState._();

  const factory InitialObservationState.initial() = InitialObservationInitial;
  const factory InitialObservationState.post({
    required Record record,
    required MedicalInformationGeneral medicalInformationGeneral,
  }) = InitialObservationPost;
  const factory InitialObservationState.success() = InitialObservationSuccess;
  const factory InitialObservationState.error() = InitialObservationError;
}
