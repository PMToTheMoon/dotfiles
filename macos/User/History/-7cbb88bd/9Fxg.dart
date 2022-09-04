part of 'doctor_consultation_request_bloc.dart';

@freezed
class DoctorConsultationRequestEvent with _$DoctorConsultationRequestEvent {
  const DoctorConsultationRequestEvent._();

  const factory DoctorConsultationRequestEvent.unfoldRequested() =
      _DoctorConsultationRequestEvent;
  const factory DoctorConsultationRequestEvent.optionSelected() =
      _DoctorConsultationRequestEvent;
  const factory DoctorConsultationRequestEvent.foldRequested() =
      _DoctorConsultationRequestEvent;
}
