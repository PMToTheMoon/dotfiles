import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:rxdart/rxdart.dart';

part 'patient_list_bloc.freezed.dart';
part 'patient_list_event.dart';
part 'patient_list_state.dart';

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.userService,
  }) : super(const PatientListInitial()) {
    on<PatientListFetchRequested>(
      _onFetchRequested,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .asyncExpand(mapper);
      },
    );
  }

  final UserService userService;

  Future<void> _onFetchRequested(
    PatientListFetchRequested event,
    Emitter emit,
  ) async {
    if (state is PatientListFetching) return;
    if (state.filter == event.filter) return;
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
