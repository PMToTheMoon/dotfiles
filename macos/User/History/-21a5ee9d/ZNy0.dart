part of 'record_doctors_bloc.dart';

@freezed
class RecordDoctors with _$RecordDoctors {
  const RecordDoctors._();

  const factory RecordDoctors.post({
    required Set<SelectedDoctor> request,
  }) = RecordDoctorsPost;

  const factory RecordDoctors.success() = RecordDoctorsSuccess;
  const factory RecordDoctors.error() = RecordDoctorsError;
}
