part of 'doctor_list_bloc.dart';

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();

  const factory DoctorListState.initial({
    String? filter,
    required List<Doctor> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListInitial;

  const factory DoctorListState.fetch({
    String? filter,
    required List<Doctor> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListFetch;

  const factory DoctorListState.present({
    String? filter,
    required List<Doctor> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListPresent;

  const factory DoctorListState.error({
    String? filter,
    required List<Doctor> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListError;
}
