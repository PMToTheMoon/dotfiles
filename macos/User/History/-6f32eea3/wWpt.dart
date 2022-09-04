part of 'new_payment_method_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class NewPaymentMethodEvent with _$NewPaymentMethodEvent {
  const NewPaymentMethodEvent._();

  const factory NewPaymentMethodEvent.urlSuccessfullyReceived() = _NewPaymentMethodEvent;
}