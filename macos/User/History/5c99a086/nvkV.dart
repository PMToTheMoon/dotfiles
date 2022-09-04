part of 'doctor_list_bloc.dart';

@freezed
class DoctorTile with _$SelectedDoctor {
  const DoctorTile._();

  const factory DoctorTile({
    required Doctor doctor,
    required DoctorConsultationRequestTileData state,
  }) = _SelectedDoctor;
}

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();

  const factory DoctorListState.initial({
    String? filter,
    required Set<DoctorTile> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListInitial;

  const factory DoctorListState.fetch({
    String? filter,
    required Set<DoctorTile> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListFetch;

  const factory DoctorListState.present({
    String? filter,
    required Set<DoctorTile> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListPresent;

  const factory DoctorListState.error({
    String? filter,
    required Set<DoctorTile> selectedDoctors,
    required List<Doctor> doctors,
  }) = DoctorListError;
}
