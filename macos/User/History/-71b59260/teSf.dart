import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/patient/patient_service.dart';

part 'patient_records.freezed.dart';
part 'patient_records_event.dart';
part 'patient_records_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.patientService,
  }) : super(const PatientListInitial()) {
    on<PatientListFetchRequested>(_onFetchRequested);
  }

  final PatientService patientService;

  Future<void> _onFetchRequested(
    PatientListFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientListFetching) return;
    if (state is! PatientListInitial &&
        state.filter == event.filter &&
        event.force != true) return;
    emit(PatientListFetching(
      filter: event.filter,
    ));
    try {
      final list = await userService.fetchPatients(event.filter);
      emit(PatientListReady(
        filter: event.filter,
        patients: list,
      ));
    } catch (e) {
      emit(PatientListError(
        filter: event.filter,
      ));
    }
  }
}
