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
    on<ObservationsAddComplementButtonPressed>(_onCompleteRecordButtonPressed);
    on<ObservationsGeneralRapportFormSubmitted>(_onGeneralRapportFormSubmitted);
    on<ObservationsComplementFormSubmitted>(_onComplementFormSubmitted);
  }

  final String recordId;
  final RecordService recordService;

  Future<void> _onCompleteRecordButtonPressed(
    ObservationsAddComplementButtonPressed event,
    Emitter emit,
  ) async {
    emit(ObservationsState.displayComplementForm(
      complementType: event.complementType,
    ));
  }

  Future<void> _onGeneralRapportFormSubmitted(
    ObservationsGeneralRapportFormSubmitted event,
    Emitter emit,
  ) async {
    if (state is ObservationsPostForm) return;
    emit(const ObservationsState.postForm());
    try {
      await recordService.addRapportToGeneralRecord(
        recordId,
        event.rapport,
        noConsultation: event.noConsultation,
      );
      emit(const ObservationsState.success());
    } catch (e) {
      emit(const ObservationsState.error());
    } finally {
      emit(const ObservationsState.idle());
    }
  }

  Future<void> _onComplementFormSubmitted(
    ObservationsComplementFormSubmitted event,
    Emitter emit,
  ) async {
    if (state is ObservationsPostForm) return;
    emit(const ObservationsState.postForm());
    try {
      await recordService.addComplementToRecord(recordId, event.complement);
      emit(const ObservationsState.success());
    } catch (e) {
      emit(const ObservationsState.error());
    } finally {
      emit(const ObservationsState.idle());
    }
  }
}
