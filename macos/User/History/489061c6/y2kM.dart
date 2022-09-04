part of 'new_payment_method_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_method_state.freezed.dart';

@freezed
class NewPaymentMethodState with _$NewPaymentMethodState {
  const NewPaymentMethodState._();

  const factory NewPaymentMethodState.requestingUrl() = NewPayementMethod;
  const factory NewPaymentMethodState.displayingUrl() = NewPayementMethod;
}