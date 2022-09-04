part of 'record_doctors_bloc.dart';

@freezed
class RecordDoctorsEvent with _$RecordDoctorsEvent {
  const RecordDoctorsEvent._();

  const factory RecordDoctorsEvent.servicesRequested({
    required String recordId,
    required Set<DoctorServiceRequest> requests,
  }) = RecordDoctorsServicesRequested;
}
