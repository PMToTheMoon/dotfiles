import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_method_bloc.freezed.dart';
part 'new_payment_method_event.dart';
part 'new_payment_method_state.dart';

class NewPaymentMethodBloc
    extends StateMachine<NewPaymentMethodEvent, NewPaymentMethodState> {
  NewPaymentMethodBloc() : super(const NewPaymentMethodRequestingUrl()) {
    define<NewPaymentMethodRequestingUrl>(($) => $
      ..onEnter(_requestUrl)
      ..on<NewPaymentMethodUrlSuccessfullyReceived>(_toDisplayUrl)
      ..on<NewPaymentMethodUrlSuccessfullyReceived>(_toError));
    define<NewPaymentMethodDisplayingUrl>();
    define<NewPaymentMethodError>();
  }

  NewPaymentMethodDisplayingUrl _toDisplayUrl(
    NewPaymentMethodUrlSuccessfullyReceived e,
    _,
  ) =>
      NewPaymentMethodDisplayingUrl(url: e.url);

  NewPaymentMethodError _toError(e, s) => const NewPaymentMethodError();

  Future<void> _requestUrl(s) async {}
}
