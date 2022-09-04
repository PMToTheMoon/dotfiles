import 'dart:async';

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
  }) : super(const CandidateProfessionalExperiencesInitial()) {
    on<CandidateProfessionalExperiencesStarted>(_onStarted);
    on<CandidateProfessionalExperiencesCreated>(_onExperienceCreated);
    on<CandidateProfessionalExperiencesUpdated>(_onExperienceUpdated);
    on<CandidateProfessionalExperiencesDeleted>(_onExperienceDeleted);
    // sub = candidateRepository.professionalExperiencesStream.listen((event) {
    //   print(state);
    //   emit(CandidateProfessionalExperiencesState.ready(
    //       experiences: event, pendingDeletions: {}, pendingUpdates: {}));
    // });
  }

  final CandidateRepository candidateRepository;
  // StreamSubscription<List<ProfessionalExperience>>? sub;

  @override
  Future<void> close() async {
    // await sub?.cancel();
    return super.close();
  }

  Future<void> _onStarted(
    CandidateProfessionalExperiencesStarted event,
    Emitter emit,
  ) async {
    final experiences = candidateRepository.professionalExperiences;
    if (experiences != null) {
      emit(
        CandidateProfessionalExperiencesState.ready(
          experiences: experiences,
          pendingDeletions: {},
          pendingUpdates: {},
        ),
      );
    } else {
      emit(const CandidateProfessionalExperiencesState.loading());
      candidateRepository.fetchProfessionalExperiences();
    }
    await emit.forEach(
      candidateRepository.professionalExperiencesStream,
      onData: (List<ProfessionalExperience> e) =>
          CandidateProfessionalExperiencesState.ready(
        experiences: e,
        pendingDeletions: {},
        pendingUpdates: {},
      ),

      // onData: (List<ProfessionalExperience> experiences) => state.maybeMap(
      //   ready: (oldState) => oldState.copyWith(experiences: experiences),
      //   orElse: () => CandidateProfessionalExperiencesState.ready(
      //     experiences: experiences,
      //     pendingDeletions: {},
      //     pendingUpdates: {},
      //   ),
      // ),
      onError: (_, __) => const CandidateProfessionalExperiencesState.error(),
    );
  }

  _onExperienceCreated(
      CandidateProfessionalExperiencesCreated event, Emitter emit) async {
    final currentState = state;
    if (currentState is! CandidateProfessionalExperiencesReady) return;
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
