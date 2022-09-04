import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_bloc.freezed.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends StateMachine<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState.waitingSubmission()) {
    define<ContactStateWaitingSubmission>(
        ($) => $..on<ContactEventMessageSubmitted>(_toSubmitting));
    define<ContactStateSubmitting>();
    define<ContactStateSuccess>();
    define<ContactStateError>(
        ($) => $..on<ContactEventMessageSubmitted>(_toSubmitting));
  }

  ContactStateSubmitting _toSubmitting(ContactEventMessageSubmitted e, s) =>
      ContactStateSubmitting(message: e.message);

  ContactStateSuccess _toSuccess(e, s) => const ContactStateSuccess();

  ContactStateSuccess _toSuccess(e, s) => const ContactStateSuccess();
}
