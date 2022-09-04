import 'package:app_client/user/user.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_passenger_bloc.freezed.dart';
part 'new_passenger_event.dart';
part 'new_passenger_state.dart';

class NewPassengerBloc
    extends StateMachine<NewPassengerEvent, NewPassengerState> {
  NewPassengerBloc({
    required this.userRepository,
  }) : super(
          const NewPassengerInitial(),
        ) {
    define<NewPassengerInitial>(
      ($) => $..on<NewPassengerFormSubmitted>(_onFormSubmitted),
    );
    define<NewPassengerError>(
      ($) => $..on<NewPassengerFormSubmitted>(_onFormSubmitted),
    );
    define<NewPassengerApiRequest>(
      ($) => $
        ..onEnter(_submitForm)
        ..on<NewPassengerSuccessfullyCreated>(_onSuccessfullyCreated)
        ..on<NewPassengerCreationError>(_onCreationError),
    );
    define<NewPassengerSuccess>();
  }

  final UserRepository userRepository;

  NewPassengerApiRequest _onFormSubmitted(
    NewPassengerFormSubmitted event,
    NewPassengerState state,
  ) =>
      NewPassengerApiRequest(data: event.data);

  NewPassengerSuccess _onSuccessfullyCreated(
    NewPassengerSuccessfullyCreated event,
    NewPassengerApiRequest state,
  ) =>
      const NewPassengerSuccess();

  NewPassengerError _onCreationError(
    NewPassengerCreationError event,
    NewPassengerApiRequest state,
  ) =>
      const NewPassengerError();

  Future<void> _submitForm(NewPassengerApiRequest state) async {
    try {
      await userRepository.newPassenger(state.data);
      final lastID = userRepository.user?.favoritePassengers.lastOrNull?.id;
      if (lastID != null) {
        await userRepository.setDefaultPassengerID(lastID);
      }
      add(const NewPassengerSuccessfullyCreated());
    } catch (e) {
      add(
        NewPassengerCreationError(error: e.toString()),
      );
    }
  }
}
