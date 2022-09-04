import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_list_bloc.freezed.dart';
part '_patient_list_state.dart';
part '_patient_list_event.dart';

class PatientListBloc extends StateMachine<PatientListEvent, PatientListState> {
  PatientListBloc() : super(const PatientListFetching()) {
    define<PatientListFetching>(($) => $..onEnter(_fetchList));
    define<PatientListReady>(($) => $);
    define<PatientListError>(($) => $);
    define<PatientListEmpty>(($) => $);
  }
}
