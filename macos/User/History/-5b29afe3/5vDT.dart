part of 'doctor_list_bloc.dart';

@freezed
class DoctorListEvent with _$DoctorListEvent {
  const DoctorListEvent._();

  const factory DoctorListEvent.started() = DoctorListFetchRequested;
  const factory DoctorListEvent.filterChanged() = DoctorListCriteriaChanged;
  const factory DoctorListEvent.doctorSelected() = DoctorListCriteriaChanged;
}
