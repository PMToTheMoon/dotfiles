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
      CandidateProfessionalExperiencesCreated event, Emitter emit) async {
    final currentState = state;
    if (currentState.pendingCreate == true) return;
    try {
      await candidateRepository.createProfessionalExperience(
        event.data,
      );
    } catch (e) {
      emit(const CandidateProfessionalExperiencesError());
    }
  }

  _onExperienceUpdated(
      CandidateProfessionalExperiencesUpdated event, Emitter emit) async {
    final currentState = state;
    if (currentState is! CandidateProfessionalExperiencesReady) return;
    try {
      await candidateRepository.updateProfessionalExperience(
        event.update,
      );
    } catch (e) {
      emit(const CandidateProfessionalExperiencesError());
    }
  }

  _onExperienceDeleted(
      CandidateProfessionalExperiencesDeleted event, Emitter emit) async {
    final currentState = state;
    if (currentState is! CandidateProfessionalExperiencesReady) return;
    try {
      await candidateRepository.deleteProfessionalExperience(event.id);
    } catch (e) {
      emit(const CandidateProfessionalExperiencesError());
    }
  }
}
