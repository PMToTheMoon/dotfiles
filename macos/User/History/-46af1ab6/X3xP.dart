part of 'patient_list_bloc.dart';

// TODO: implements hash and ==

abstract class PatientListState {}

class PatientListFetching implements PatientListState {}

class PatientListReady implements PatientListState {
  PatientListReady(this.data);
  final int data;
}

class PatientListError implements PatientListState {}


@freezed
class PatientListState with _$PatientListState {


  const factory PatientListState.() = _PatientListState;
}
