import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'observations_bloc.freezed.dart';
part 'observations_event.dart';
part 'observations_state.dart';

class ObservationsBloc extends Bloc<ObservationsEvent, ObservationsState> {
  ObservationsBloc() : super(const ObservationsIdle()) {
    on<ObservationsCompleteRecordPressed>((event, emit) {
      emit();
    });
  }

  Future<void> _onCompleteRecordButtonPressed(
    ObservationsCompleteRecordPressed event,
    Emitter<ObservationsCompleteRecordPressed> emit,
  ) async {}
}
