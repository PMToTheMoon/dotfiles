part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileState
    with _$DoctorConsultationRequestTileState {
  const DoctorConsultationRequestTileState._();

  const factory DoctorConsultationRequestTileState.empty() =
      _DoctorConsultationRequestTileEmpty;
  const factory DoctorConsultationRequestTileState.presentOptions() =
      _DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileState.showOption() =
      _DoctorConsultationRequestTileShowOption;
}
