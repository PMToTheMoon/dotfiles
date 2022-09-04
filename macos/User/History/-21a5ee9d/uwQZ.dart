part of 'record_doctors_bloc.dart';

@freezed
class RecordDoctors with _$RecordDoctors {
  const RecordDoctors._();

  const factory RecordDoctors.postRequest({
    required Set<SelectedDoctor> request,
  }) = RecordDoctorsPostRequest;

  const factory RecordDoctors.success() = RecordDoctorsSuccess;
  const factory RecordDoctors.error() = RecordDoctorsError;
}
