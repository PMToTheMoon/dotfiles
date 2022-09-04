part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileEvent
    with _$DoctorConsultationRequestTileEvent {
  const DoctorConsultationRequestTileEvent._();

  const factory DoctorConsultationRequestTileEvent.unfoldRequested() =
      DoctorConsultationRequestTileUnfoldRequested;
  const factory DoctorConsultationRequestTileEvent.optionSelected() =
      DoctorConsultationRequestTileOptionSelected;
  const factory DoctorConsultationRequestTileEvent.foldRequested() =
      DoctorConsultationRequestTileFoldRequested;
}
