part of 'doctor_list_bloc.dart';

@freezed
class SelectedDoctor with _$SelectedDoctor {
  const SelectedDoctor._();

  const factory SelectedDoctor(
      {required Doctor doctor, required RequestType request}) = _SelectedDoctor;
}

@freezed
class DoctorTile with _$DoctorTile {
  const DoctorTile._();

  const factory DoctorTile({
    required Doctor doctor,
    required DoctorConsultationRequestTileController controller,
  }) = _DoctorTile;
}

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();

  const factory DoctorListState.initial({
    String? filter,
    required Set<SelectedDoctor> selectedDoctors,
    required Set<DoctorTile> doctors,
  }) = DoctorListInitial;

  const factory DoctorListState.fetch({
    String? filter,
    required Set<SelectedDoctor> selectedDoctors,
    required Set<DoctorTile> doctors,
  }) = DoctorListFetch;

  const factory DoctorListState.present({
    String? filter,
    required Set<SelectedDoctor> selectedDoctors,
    required Set<DoctorTile> doctors,
  }) = DoctorListPresent;

  const factory DoctorListState.error({
    String? filter,
    required Set<SelectedDoctor> selectedDoctors,
    required Set<DoctorTile> doctors,
  }) = DoctorListError;
}
