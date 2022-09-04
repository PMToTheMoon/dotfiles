import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_professional_experiences_bloc.freezed.dart';
part 'candidate_professional_experiences_event.dart';
part 'candidate_professional_experiences_state.dart';

class CandidateProfessionalExperiencesBloc extends Bloc<
    CandidateProfessionalExperiencesEvent,
    CandidateProfessionalExperiencesState> {
  CandidateProfessionalExperiencesBloc({
    required this.candidateRepository,
  }) : super(CandidateProfessionalExperiencesState.initial()) {
    on<CandidateProfessionalExperiencesStarted>(_onStarted);
    on<CandidateProfessionalExperiencesCreated>(_onExperienceCreated);
    on<CandidateProfessionalExperiencesUpdated>(_onExperienceUpdated);
    on<CandidateProfessionalExperiencesDeleted>(_onExperienceDeleted);
  }

  final CandidateRepository candidateRepository;

  Future<void> _onStarted(
    CandidateProfessionalExperiencesStarted event,
    Emitter emit,
  ) async {
    final experiences = candidateRepository.professionalExperiences;
    if (experiences != null) {
      emit(state.copyWith(experiences: experiences));
    } else {
      emit(state.copyWith(isLoading: true));
      candidateRepository.fetchProfessionalExperiences();
    }
    await emit.forEach(
      candidateRepository.professionalExperiencesStream,
      onData: (List<ProfessionalExperience> data) => state.copyWith(
        experiences: data,
      ),
      onError: (error, _) => state.copyWith(error: error),
    );
  }

  _onExperienceCreated(
    CandidateProfessionalExperiencesCreated event,
    Emitter emit,
  ) async {
    if (state.pendingCreate == true) return;
    try {
      await candidateRepository.createProfessionalExperience(
        event.data,
      );
      emit(state.copyWith(
        pendingCreate: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e,
        pendingCreate: false,
      ));
    }
  }

  _onExperienceUpdated(
    CandidateProfessionalExperiencesUpdated event,
    Emitter emit,
  ) async {
    Object? error;

    if (state.pendingUpdates.contains(event.update.id)) return;
    emit(state.copyWith(
      pendingUpdates: Set.from(state.pendingUpdates)..add(event.update.id),
    ));
    try {
      await candidateRepository.updateProfessionalExperience(
        event.update,
      );
    } catch (e) {
      error = e;
    } finally {
      emit(
        state.copyWith(
          error: error,
          pendingUpdates: Set.from(state.pendingUpdates)
            ..remove(event.update.id),
        ),
      );
    }
  }

  _onExperienceDeleted(
    CandidateProfessionalExperiencesDeleted event,
    Emitter emit,
  ) async {
    Object? error;

    if (state.pendingDeletions.contains(event.id)) return;
    emit(state.copyWith(
      pendingUpdates: Set.from(state.pendingDeletions)..add(event.id),
    ));
    try {
      await candidateRepository.deleteProfessionalExperience(
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
