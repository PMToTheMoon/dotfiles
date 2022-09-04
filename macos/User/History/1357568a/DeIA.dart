import 'package:bloc/bloc.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_bloc.freezed.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends StateMachine<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState.waitingSubmission()) {
    define<ContactStateWaitingSubmission>();
    define<ContactStateSending>();
    define<ContactStateSuccess>();
  }
}
