import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/user/user_repository.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';
part 'user_account_bloc.freezed.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  UserAccountBloc() : super(const UserAccountState.initial()) {
    on<UserAccountStarted>(_onUserAccountStarted);
  }

  final AuthSession session;
  final UserRepository userRepository;

  Future<void> _onUserAccountStarted(event, emit) async {
    final candidate = userRepository.account(id);
    if (candidate != null) emit(CandidateProfileReady(candidate: candidate));
    try {
      final candidate = await userRepository.fetch();
      emit(CandidateProfileState.ready(candidate: candidate));
    } catch (e) {
      emit(const CandidateProfileState.error());
    }
  }
}
