part of 'new_payment_method_bloc.dart';

@freezed
class NewPaymentMethodState with _$NewPaymentMethodState {
  const factory NewPaymentMethodState.requestingUrl() =
      NewPayementMethodRequestingUrl;
  const factory NewPaymentMethodState.displayingUrl() =
      NewPayementMethodDisplayingUrl;
  const factory NewPaymentMethodState.error() = NewPayementMethodError;
}
