part of 'doctor_list_bloc.dart';

@freezed
class DoctorListEvent with _$DoctorListEvent {
  const DoctorListEvent._();

  const factory DoctorListEvent.fetchRequested() = DoctorListFetchRequested;
  const factory DoctorListEvent.criteriaChanged() = DoctorListCriteriaChanged;
}
