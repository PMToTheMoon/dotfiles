import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_list_bloc.freezed.dart';
part 'patient_list_state.dart';
part 'patient_list_event.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.patientRepository,
  }) : super(const PatientListInitial()) {
    on<PatientListStarted>(_onPatientListStarted);
  }

  final PatientRepository patientRepository;

  Future<void> _onPatientListStarted(
    PatientListStarted event,
    Emitter emit,
  ) async {
    if (state is! PatientListFetching) {
      emit(const PatientListFetching());
      try {
        final data = await patientRepository.list();
        emit(PatientListReady(data));
      } catch (e) {
        emit(const PatientListError());
      }
    }
  }
}
