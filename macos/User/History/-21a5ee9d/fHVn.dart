part of 'record_doctors_bloc.dart';

@freezed
class RecordDoctors with _$RecordDoctors {
  const RecordDoctors._();

  const factory RecordDoctors.addDoctor({
    required Set<SelectedDoctor> request,
  }) = RecordDoctorsAddDoctor;

  const factory RecordDoctors.success() = RecordDoctorsAddDoctor;
}
