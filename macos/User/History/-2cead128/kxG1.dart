import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/record_service.dart';

part 'initial_observation_bloc.freezed.dart';
part 'initial_observation_event.dart';
part 'initial_observation_state.dart';

class InitialObservationBloc
    extends Bloc<InitialObservationEvent, InitialObservationState> {
  InitialObservationBloc({
    required this.recordService,
  }) : super(const InitialObservationInitial()) {
    on<InitialObservationSubmitted>(_onInitialObservationSubmitted);
  }

  final RecordService userService;
  final RecordService recordService;

  Future<void> _onInitialObservationSubmitted(
    InitialObservationSubmitted event,
    Emitter emit,
  ) async {
    if (state is InitialObservationPost) return;
    emit(const InitialObservationPost());
    try {
      await Future.delayed(const Duration(seconds: 3));
      await recordService.publishGeneralRecord(
        event.record,
        title: event.title,
        medicalInformation: event.medicalInformationGeneral,
        medicalContext: event.medicalContext,
      );
      await userService.fetchRecords();
      emit(const InitialObservationSuccess());
    } catch (e) {
      emit(const InitialObservationError());
    }
  }
}
