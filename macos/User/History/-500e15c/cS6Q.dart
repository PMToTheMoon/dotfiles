import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/record_service.dart';

part 'observations_bloc.freezed.dart';
part 'observations_event.dart';
part 'observations_state.dart';

class ObservationsBloc extends Bloc<ObservationsEvent, ObservationsState> {
  ObservationsBloc({
    required this.recordId,
    required this.recordService,
  }) : super(const ObservationsIdle()) {
    on<ObservationsCompleteRecordPressed>(_onCompleteRecordButtonPressed);
    on<ObservationsRapportFormSubmitted>(_onRapportFormSubmitted);
    on<ObservationsComplementFormSubmitted>(_onComplementFormSubmitted);
  }

  final String recordId;
  final RecordService recordService;

  Future<void> _onCompleteRecordButtonPressed(
    ObservationsCompleteRecordPressed event,
    Emitter emit,
  ) async {
    emit(const ObservationsState.displayComplementForm());
  }

  Future<void> _onRapportFormSubmitted(
    ObservationsRapportFormSubmitted event,
    Emitter emit,
  ) async {
    emit(const ObservationsState.idle());
  }

  Future<void> _onComplementFormSubmitted(
    ObservationsComplementFormSubmitted event,
    Emitter emit,
  ) async {
    if (state is ObservationsPostForm) return;
    emit(ObservationsPostForm);
  }
}
