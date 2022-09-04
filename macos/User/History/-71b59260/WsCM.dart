import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:zanalys/patient/patient_service.dart';

part 'patient_records_bloc.freezed.dart';
part 'patient_records_event.dart';
part 'patient_records_state.dart';

class PatientRecordsBloc
    extends Bloc<PatientRecordsEvent, PatientRecordsState> {
  PatientRecordsBloc({
    required this.patientId,
    required this.patientService,
  }) : super(const PatientRecordsInitial()) {
    on<PatientRecordsFetchRequested>(_onFetchRequested);
  }

  final String patientId;
  final PatientService patientService;

  Future<void> _onFetchRequested(
    PatientRecordsFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientRecordsFetching) return;
    emit(const PatientRecordsFetching());
    try {
      final list = await patientService.patientRecords(patientId);
      emit(PatientRecordsReady(records: list));
    } catch (e) {
      emit(const PatientRecordsError());
    }
  }
}
