import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'new_payment_method_event.dart';
part 'new_payment_method_state.dart';

class NewPaymentMethodBloc
    extends Bloc<NewPaymentMethodEvent, NewPaymentMethodState> {
  NewPaymentMethodBloc() : super(NewPaymentMethodInitial()) {
    on<NewPaymentMethodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
