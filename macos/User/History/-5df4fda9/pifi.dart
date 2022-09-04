import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/user/user_repository.dart';

part 'user_account_event.dart';
part 'user_account_state.dart';
part 'user_account_bloc.freezed.dart';

//TODO: debounce
const _kDebounceDelay = Duration(seconds: 1);

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  UserAccountBloc({
    required this.session,
    required this.userRepository,
  }) : super(const UserAccountState.initial()) {
    on<UserAccountStarted>(_onUserAccountStarted);
    on<UserAccountEventInformationEdited>(_onInformationEdited,
        transformer: restartable());
  }

  final AuthSession session;
  final UserRepository userRepository;

  Future<void> _onUserAccountStarted(event, emit) async {
    try {
      final account = await userRepository.account(session.userId);
      emit(UserAccountState.ready(account: account));
    } catch (e) {
      emit(const UserAccountError());
    }
  }

  Future<void> _onInformationEdited(
    UserAccountEventInformationEdited event,
    Emitter emit,
  ) async {
    // if (state is UserAccountLoading) return;
    emit(const UserAccountState.loading());

    try {
      await userRepository.updateAccountInformation(
          session.userId, event.update);
      final newAccount = await userRepository.account(session.userId);
      emit(UserAccountState.ready(account: newAccount));
    } catch (e) {
      emit(const UserAccountState.error());
    }
  }
}
