part of 'new_payment_method_bloc.dart';

@freezed
class NewPaymentMethodEvent with _$NewPaymentMethodEvent {
  const NewPaymentMethodEvent._();

  const factory NewPaymentMethodEvent.urlSuccessfullyReceived({
    required String url,
  }) = NewPaymentMethodUrlSuccessfullyReceived;
  const factory NewPaymentMethodEvent.urlRequestFailed() =
      NewPaymentMethodUrlRequestFailed;
}
