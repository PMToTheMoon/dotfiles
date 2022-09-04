part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileState
    with _$DoctorConsultationRequestTileState {
  const DoctorConsultationRequestTileState._();

  const factory DoctorConsultationRequestTileState.empty() =
      DoctorConsultationRequestTileEmpty;
  const factory DoctorConsultationRequestTileState.presentOptions() =
      DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileState.showOption() =
      DoctorConsultationRequestTileShowOption;
}
