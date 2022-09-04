import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/patient/patient_service.dart';

part 'patient_records.freezed.dart';
part 'patient_records_event.dart';
part 'patient_records_state.dart';

class PatientRecordsBloc
    extends Bloc<PatientRecordsEvent, PatientRecordsState> {
  PatientRecordsBloc({
    required this.patientService,
  }) : super(const PatientRecordsInitial()) {
    on<PatientRecordsFetchRequested>(_onFetchRequested);
  }

  final PatientService patientService;

  Future<void> _onFetchRequested(
    PatientRecordsFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientRecordsFetching) return;
    emit(const PatientRecordsFetching());
    try {
      final list = await patientService.fetchPatients(event.filter);
      emit(PatientRecordsReady(
        filter: event.filter,
        patients: list,
      ));
    } catch (e) {
      emit(PatientRecordsError(
        filter: event.filter,
      ));
    }
  }
}
