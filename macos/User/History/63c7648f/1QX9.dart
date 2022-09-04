import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate_repository.dart';

part 'candidate_profile_event.dart';
part 'candidate_profile_state.dart';
part 'candidate_profile_bloc.freezed.dart';

/**
 * ARCHITECTURE PLAN
 * 
 * This bloc will store candidate profile infos
 * Since theses data will changed in time (user can edit data), this bloc should 
 * have a mechanisme to beein updated. Idealy this should be automatic, we don't
 * want to use an event to request data update.
 * 
 * The solution is probably to provide a candidateProfileUpdate stream inside the
 * candidate repository.
 * 
 */

class CandidateProfileBloc
    extends Bloc<CandidateProfileEvent, CandidateProfileState> {
  CandidateProfileBloc({
    required this.userRepository,
  }) : super(userRepository.candidate != null
            ? CandidateProfileState.ready(candidate: userRepository.candidate!)
            : const CandidateProfileState.initial()) {
    on<CandidateProfileStarted>(_onStarted);
    on<CandidateProfileCandidateChanged>(_onCandidateChanged);

    _candidateStreamSubscription = userRepository.candidateStream.listen(
      (candidate) => add(
        CandidateProfileEvent.candidateChanged(newCandidate: candidate),
      ),
    );
  }

  final UserCandidateRepository userRepository;

  late final StreamSubscription<Candidate> _candidateStreamSubscription;

  Future<void> _onStarted(CandidateProfileStarted event, Emitter emit) async {
    final candidate = userRepository.candidate;
    if (candidate != null) emit(CandidateProfileReady(candidate: candidate));
    try {
      final candidate = await userRepository.fetch();
      emit(CandidateProfileState.ready(candidate: candidate));
    } catch (e) {
      emit(const CandidateProfileState.error());
    }
  }

  void _onCandidateChanged(
    CandidateProfileCandidateChanged event,
    Emitter emit,
  ) {
    emit(CandidateProfileReady(
      candidate: event.newCandidate,
    ));
  }

  @override
  Future<void> close() async {
    await _candidateStreamSubscription.cancel();
    return super.close();
  }
}
