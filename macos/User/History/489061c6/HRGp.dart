part of 'new_payment_method_bloc.dart';

@freezed
class NewPaymentMethodState with _$NewPaymentMethodState {
  const factory NewPaymentMethodState.requestingUrl() =
      NewPaymentMethodRequestingUrl;
  const factory NewPaymentMethodState.displayingUrl() =
      NewPaymentMethodDisplayingUrl;
  const factory NewPaymentMethodState.error() = NewPaymentMethodError;
}
