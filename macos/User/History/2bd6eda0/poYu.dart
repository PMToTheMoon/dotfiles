import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/patient/patient_service.dart';

part 'patient_records_bloc.freezed.dart';
part 'patient_records_event.dart';
part 'patient_records_state.dart';

typedef PatientDetails = int;

class PatientDetailsBloc
    extends Bloc<PatientDetailsEvent, PatientDetailsState> {
  PatientDetailsBloc({
    required this.patientId,
    required this.patientService,
  }) : super(const PatientDetailsInitial()) {
    on<PatientDetailsFetchRequested>(_onFetchRequested);
  }

  final String patientId;
  final PatientService patientService;

  Future<void> _onFetchRequested(
    PatientDetailsFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientDetailsFetching) return;
    emit(const PatientDetailsFetching());
    try {
      final list = await patientService.PatientDetails(patientId);
      emit(PatientDetailsReady(records: list));
    } catch (e) {
      emit(const PatientDetailsError());
    }
  }
}
