part of 'doctor_list_bloc.dart';

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();

  const factory DoctorListState.initial() = _DoctorListState;
  const factory DoctorListState.fetch() = _DoctorListState;
  const factory DoctorListState.present({
    List<Doctor> doctors,
  }) = _DoctorListState;
}
