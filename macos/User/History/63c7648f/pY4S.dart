import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

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
  CandidateProfileBloc() : super(const CandidateProfileState.initial()) {
    on<CandidateProfileStarted>((event, emit) {});
  }
}
