part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileData
    with _$DoctorConsultationRequestTileState {
  const DoctorConsultationRequestTileData._();

  const factory DoctorConsultationRequestTileData.empty() =
      DoctorConsultationRequestTileEmpty;
  const factory DoctorConsultationRequestTileData.presentOptions() =
      DoctorConsultationRequestTilePresentOptions;
  const factory DoctorConsultationRequestTileData.showOption() =
      DoctorConsultationRequestTileShowOption;
}
