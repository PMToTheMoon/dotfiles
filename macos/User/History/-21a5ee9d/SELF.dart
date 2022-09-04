part of 'record_doctors_bloc.dart';

@freezed
class RecordDoctorsState with _$RecordDoctorsState {
  const RecordDoctorsState._();

  const factory RecordDoctorsState.idle() = RecordDoctorsIdle;

  const factory RecordDoctorsState.postRequest({
    required Set<SelectedDoctor> request,
  }) = RecordDoctorsPostRequest;

  const factory RecordDoctorsState.success() = RecordDoctorsSuccess;
  const factory RecordDoctorsState.error() = RecordDoctorsError;
}
