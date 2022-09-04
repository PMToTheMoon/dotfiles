const bloc = """
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/patient/models/patient_details.dart';
import 'package:zanalys/patient/patient_service.dart';

part 'patient_details_bloc.freezed.dart';
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
    if (state is PatientDetailsFetching) return;
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

const states = """
part of 'patient_details_bloc.dart';

@freezed
class PatientDetailsState with _$PatientDetailsState {
  const PatientDetailsState._();

  const factory PatientDetailsState.initial() = PatientDetailsInitial;

  const factory PatientDetailsState.fetching() = PatientDetailsFetching;

  const factory PatientDetailsState.ready({
    required PatientDetails details,
  }) = PatientDetailsReady;

  const factory PatientDetailsState.error() = PatientDetailsError;
}
""";
