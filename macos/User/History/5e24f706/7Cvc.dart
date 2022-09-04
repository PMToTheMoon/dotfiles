import 'package:bloc/bloc.dart';
part 'patient_list_state.dart';
part 'patient_list_event.dart';

class PatientListBloc extends Bloc {
  const PatientListBloc(patientListFetching) : super('test');
}
