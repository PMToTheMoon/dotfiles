part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestTileEvent
    with _$DoctorConsultationRequestTileEvent {
  const DoctorConsultationRequestTileEvent._();

  const factory DoctorConsultationRequestTileEvent.unfoldRequested() =
      _DoctorConsultationRequestEvent;
  const factory DoctorConsultationRequestTileEvent.optionSelected() =
      _DoctorConsultationRequestEvent;
  const factory DoctorConsultationRequestTileEvent.foldRequested() =
      _DoctorConsultationRequestEvent;
}
