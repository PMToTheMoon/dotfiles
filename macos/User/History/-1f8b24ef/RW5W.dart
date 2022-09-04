import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_list_bloc.freezed.dart';
part '_patient_list_state.dart';
part '_patient_list_event.dart';

class PatientListBloc extends StateMachine<PatientListEvent, PatientListState> {
  PatientListBloc() : super(PatientListFetching()) {
    define<PatientListFetching>(($) => $
      ..onEnter(_fetch)
      ..on<PatientFetchSucceed>(_toReadyOrEmpty)
      ..on<PatientFetchFailed>(_toError));

    define<PatientListCanFetch>(($) => $
      ..on<PatientFetchRequested>(_toFetching)
      ..define<PatientListReady>()
      ..define<PatientListError>()
      ..define<PatientListEmpty>());
  }

  PatientListFetching _toFetching(e, s) => PatientListFetching();

  PatientListCanFetch _toReady(PatientFetchSucceed e, s) {}
}
