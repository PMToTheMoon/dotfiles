import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/user/user_repository.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';
part 'user_account_bloc.freezed.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  UserAccountBloc({
    required this.session,
  }) : super(const UserAccountState.initial()) {
    on<UserAccountStarted>(_onUserAccountStarted);
  }

  final AuthSession session;
  final UserRepository userRepository;

  Future<void> _onUserAccountStarted(event, emit) async {
    try {
      final user = await userRepository.account(session.userId);
      emit(UserAccountState.ready(user: user));
    } catch (e) {
      emit(const CandidateProfileState.error());
    }
  }
}
