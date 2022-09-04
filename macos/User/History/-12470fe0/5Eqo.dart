import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_list_bloc.freezed.dart';
part '_patient_list_state.dart';
part '_patient_list_event.dart';

class PatientListBloc extends StateMachine<PatientListEvent, PatientListState> {
  PatientListBloc() : super(PatientListFetching()) {
    define<PatientListCanFetch>(($) => $
      ..on<PatientFetchRequested>(_toFetching)
      ..define<PatientListReady>()
      ..define<PatientListError>());

    define<PatientListFetching>(($) => $
      ..onEnter(_fetch)
      ..on<PatientFetchSucceed>(_toReady)
      ..on<PatientFetchFailed>(_toError));
  }

  PatientListFetching _toFetching(e, s) => PatientListFetching();

  PatientListReady _toReady(PatientFetchSucceed e, s) =>
      PatientListReady(e.data);

  PatientListError _toError(PatientFetchFailed e, s) => PatientListError();
}
