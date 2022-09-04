part of 'doctor_list_bloc.dart';

@freezed
class DoctorListEvent with _$DoctorListEvent {
  const DoctorListEvent._();

  const factory DoctorListEvent.started() = DoctorListStarted;
  const factory DoctorListEvent.filterChanged() = DoctorListFilterChanged;
  const factory DoctorListEvent.doctorSelected() = DoctorListDoctorSelected;
  const factory DoctorListEvent.doctorUnselected() = DoctorListDoctorUnselected;
}
