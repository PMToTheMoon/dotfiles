import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "patient_list_bloc.freezed.dart";
part "_patient_list_state.dart";
part "_patient_list_event.dart";

class API {
  Future<int> fetch() async => 0;
}

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.sourceAPI,
  }) : super(PatientListFetching()) {
    on<PatientFetchRequested>(_onPatientFetchRequested);
  }

  final API sourceAPI;

  Future<void> _onPatientFetchRequested(
    PatientFetchRequested event,
    Emitter emit,
  ) async {
    if (state is! PatientFetchRequested) {
      try {
        final data = await sourceAPI.fetch();
        emit(PatientListReady(data));
      } catch (e) {
        emit(PatientListError());
      }
    }
  }
}
