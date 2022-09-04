part of 'new_payment_method_bloc.dart';

@freezed
class NewPaymentMethodEvent with _$NewPaymentMethodEvent {
  const NewPaymentMethodEvent._();

  const factory NewPaymentMethodEvent.urlSuccessfullyReceived() =
      NewPaymentMethodUrlSuccessfullyReceived;
  const factory NewPaymentMethodEvent.urlRequestFailed() =
      NewPaymentMethodUrlRequestFailed;
}
