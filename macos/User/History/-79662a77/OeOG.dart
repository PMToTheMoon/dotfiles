part of 'payment_methods_bloc.dart';

@freezed
class PaymentMethodsEvent with _$PaymentMethodsEvent {
  const PaymentMethodsEvent._();

  const factory PaymentMethodsEvent.paymentMethodSelected(
    int paymentMethodID,
  ) = PaymentMethodSelected;

  const factory PaymentMethodsEvent.costCenterSelected(
    int paymentMethodID,
    String costCenter,
  ) = CostCenterSelected;

  const factory PaymentMethodsEvent.newPaymentMethodAdded(
    int paymentMethodID,
    String costCenter,
  ) = CostCenterSelected;
}
