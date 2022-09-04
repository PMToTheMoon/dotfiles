part of 'doctor_list_bloc.dart';

@freezed
class DoctorListEvent with _$DoctorListEvent {
  const DoctorListEvent._();

  const factory DoctorListEvent.started() = DoctorListStarted;

  const factory DoctorListEvent.filterChanged({
    String? filter,
  }) = DoctorListFilterChanged;

  const factory DoctorListEvent.doctorSelected({
    required Patient doctor,
  }) = DoctorListDoctorSelected;

  const factory DoctorListEvent.doctorUnselected({
    required Patient doctor,
  }) = DoctorListDoctorUnselected;
}
