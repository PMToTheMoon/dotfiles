part of 'doctor_list_bloc.dart';

@freezed
class DoctorListState with _$DoctorListState {
  const DoctorListState._();

  const factory DoctorListState.initial() = _DoctorListInitial;
  const factory DoctorListState.fetch() = _DoctorListFetch;
  const factory DoctorListState.present({
    required List<Doctor> doctors,
  }) = DoctorListPresent;
}
