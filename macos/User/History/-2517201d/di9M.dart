import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/user/user.dart';

part 'user_personal_information_event.dart';
part 'user_personal_information_state.dart';
part 'user_personal_information_bloc.freezed.dart';

class UserPersonalInformationBloc
    extends Bloc<UserPersonalInformationEvent, UserPersonalInformationState> {
  UserPersonalInformationBloc({
    required this.session,
    required this.userRepository,
  }) : super(const UserPersonalInformationState.initial()) {
    on<UserPersonalInformationStarted>(_onStarted);
    on<UserPersonalInformationFormSubmitted>(_onFormSubmitted);
  }

  final AuthSession session;
  final UserRepository userRepository;

  Future<void> _onStarted(
    UserPersonalInformationStarted event,
    Emitter emit,
  ) async {}

  Future<void> _onFormSubmitted(
    UserPersonalInformationFormSubmitted event,
    Emitter emit,
  ) async {
    if (state is UserPersonalInformationUpdating) return;
    emit(UserPersonalInformationUpdating);
    try {
      await userRepository.updateAccountInformation(
          session.userId, event.update);
      emit(const UserPersonalInformationSuccess());
    } catch (e) {
      emit(const UserPersonalInformationError());
    }
  }
}
