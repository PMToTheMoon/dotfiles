import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_method_bloc.freezed.dart';
part 'new_payment_method_event.dart';
part 'new_payment_method_state.dart';

class NewPaymentMethodBloc
    extends StateMachine<NewPaymentMethodEvent, NewPaymentMethodState> {
  NewPaymentMethodBloc() : super(const NewPaymentMethodRequestingUrl()) {
    define<NewPaymentMethodRequestingUrl>();
  }
}
