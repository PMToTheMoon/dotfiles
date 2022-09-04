import 'package:app_client/user/user.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_bloc.freezed.dart';
part 'payment_methods_event.dart';
part 'payment_methods_state.dart';

class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc({
    required this.userRepository,
  }) : super(PaymentMethodsState()) {
    on<PaymentMethodSelected>(_onPaymentMethodSelected);
    on<CostCenterSelected>(_onCostCenterSelected);
    on<NewPaymentMethodAdded>(_onNewPaymentMethodAdded);
  }

  final UserRepository userRepository;

  Future<void> _onPaymentMethodSelected(
    PaymentMethodSelected event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    await userRepository.setDefaultPaymentMethodID(event.paymentMethodID);
  }

  Future<void> _onCostCenterSelected(
    CostCenterSelected event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    await userRepository.setDefaultPaymentMethodID(event.paymentMethodID);
    await userRepository.setPaymentMethodCostCenter(
      event.paymentMethodID,
      event.costCenter,
    );
  }
}
