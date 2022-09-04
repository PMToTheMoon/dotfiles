import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:stream_transform/stream_transform.dart';

part 'patient_list_bloc.freezed.dart';
part 'patient_list_event.dart';
part 'patient_list_state.dart';

const _kThrottleDelay = Duration(milliseconds: 333);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(_kThrottleDelay), mapper);
  };
}

class PatientListBloc extends Bloc<PatientListEvent, PatientListState> {
  PatientListBloc({
    required this.userService,
  }) : super(const PatientListInitial(filter: '')) {
    on<PatientListFetchRequested>(
      _onFetchRequested,
      transformer: throttleDroppable(_kThrottleDelay),
    );
  }

  final UserService userService;

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
