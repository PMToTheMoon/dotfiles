import 'package:app_client/home/home.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_bloc.freezed.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends StateMachine<ContactEvent, ContactState> {
  ContactBloc({
    required this.reservationRepository,
  }) : super(const ContactState.waitingSubmission()) {
    define<ContactStateWaitingSubmission>(
        ($) => $..on<ContactEventMessageSubmitted>(_toSubmitting));

    define<ContactStateSubmitting>(($) => $
      ..onEnter(_submit)
      ..on<ContactEventSuccessfullySubmitted>(_toSuccess)
      ..on<ContactEventSubmissionFailed>(_toError));

    define<ContactStateSuccess>();

    define<ContactStateError>(
        ($) => $..on<ContactEventMessageSubmitted>(_toSubmitting));
  }

  final ReservationRepository reservationRepository;

  ContactStateSubmitting _toSubmitting(ContactEventMessageSubmitted e, s) =>
      ContactStateSubmitting(message: e.message);

  ContactStateSuccess _toSuccess(e, s) => const ContactStateSuccess();

  ContactStateError _toError(e, s) => const ContactStateError();

  void _submit(ContactStateSubmitting s) {
    add(const ContactEvent.submissionFailed());
  }
}
