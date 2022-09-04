import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_profile_event.dart';
part 'candidate_profile_state.dart';
part 'candidate_profile_bloc.freezed.dart';

class CandidateProfileBloc
    extends Bloc<CandidateProfileEvent, CandidateProfileState> {
  CandidateProfileBloc() : super(const CandidateProfileState.initial()) {
    on<CandidateProfileStarted>((event, emit) {});
  }
}
