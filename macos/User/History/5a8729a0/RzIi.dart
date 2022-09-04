import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/user/user_service.dart';

part 'patient_list_bloc.freezed.dart';
part 'patient_list_event.dart';
part 'patient_list_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.userService,
  }) : super(const PatientListInitial()) {
    on<PatientListFetchRequested>(_onFetchRequested);
  }

  final UserService userService;

  Future<void> _onFetchRequested(
    PatientListFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientListFetching) return;
    emit(const PatientListFetching());
    try {
      final list = await userService.fetchPatients(event.filter);
      emit(PatientListReady(
        patients: list,
      ));
    } catch (e) {
      emit(const PatientListError());
    }
  }
}
