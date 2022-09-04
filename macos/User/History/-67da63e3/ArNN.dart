const bloc = """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/patient/models/patient_details.dart';
import 'package:zanalys/patient/patient_service.dart';

part '{{ bloc.freezed_file }}';
part '{{ bloc.event.file }}';
part '{{ bloc.state.file }}';

class {{ bloc.class }} extends Bloc<{{ bloc.event.class }}, {{ bloc.state.class }}> {
  {{ bloc.class }}({
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
    if (state is {{ states.fetching.class }}) return;
    emit(const PatientDetailsFetching());
    try {
      final data = await patientService.patientDetails(patientId);
      emit(PatientDetailsReady(details: data));
    } catch (e) {
      emit(const PatientDetailsError());
    }
  }
}
""";
