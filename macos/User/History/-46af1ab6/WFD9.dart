part of 'patient_list_bloc.dart';

// TODO: implements

abstract class PatientListState {}

class PatientListFetching implements PatientListState {}

abstract class PatientListCanFetch extends PatientListState {}

class PatientListReady implements PatientListCanFetch {}

class PatientListError implements PatientListCanFetch {}

class PatientListEmpty implements PatientListCanFetch {}
