import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_educations_bloc.freezed.dart';
part 'candidate_educations_event.dart';
part 'candidate_educations_state.dart';

class CandidateEducationsBloc
    extends Bloc<CandidateEducationsEvent, CandidateEducationsState> {
  CandidateEducationsBloc({
    required this.candidateRepository,
  }) : super(CandidateEducationsState.initial()) {
    on<CandidateEducationsStarted>(_onStarted);
    on<CandidateEducationsDeleted>(_onEducationDeleted);
  }

  final CandidateRepository candidateRepository;

  Future<void> _onStarted(
    CandidateEducationsStarted event,
    Emitter emit,
  ) async {
    final sub = emit.forEach(
      candidateRepository.educationsStream,
      onData: (List<Education> data) => state.copyWith(
        educations: List.from(data),
        isLoading: false,
        error: null,
      ),
      onError: (error, _) => state.copyWith(
        isLoading: false,
        error: error,
      ),
    );

    final educations = candidateRepository.educations;
    if (educations != null) {
      emit(state.copyWith(
        educations: educations,
        isLoading: false,
      ));
    } else {
      candidateRepository.fetchEducations();
      emit(state.copyWith(isLoading: true));
    }

    return sub;
  }

  _onEducationDeleted(
    CandidateEducationsDeleted event,
    Emitter emit,
  ) async {
    Object? error;

    if (state.pendingDeletions.contains(event.id)) return;
    emit(state.copyWith(
      pendingUpdates: Set.from(state.pendingDeletions)..add(event.id),
    ));
    try {
      await candidateRepository.deleteEducation(
        event.id,
      );
    } catch (e) {
      error = e;
    } finally {
      emit(
        state.copyWith(
          error: error,
          pendingDeletions: Set.from(state.pendingDeletions)..remove(event.id),
        ),
      );
    }
  }
}
