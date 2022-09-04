import 'package:app_client/user/user.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:common/common.dart';
import 'package:app_client/payment_methods/payment_methods.dart';

part '_cb_payment_method.dart';
part '_company_payment_method.dart';
part '_onboarding_payment_method.dart';
part '_prepaid_payment_method.dart';

const double _iconSize = Dimensions.icon2;

class PaymentMethodsPage extends StatelessWidget {
  static const String route = "/payment_methods";
  static Widget builder(_) => const PaymentMethodsPage();

  const PaymentMethodsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentMethodsBloc>(
      create: (context) => PaymentMethodsBloc(
        userRepository: context.read(),
      ),
      child: Page(
        appBar: titledAppBar(
          context,
          title: context.l10n.payment_methods_page_title,
        ),
        body: const _PaymentMethodsPageBody(),
      ),
    );
  }
}

class _PaymentMethodsPageBody extends StatelessWidget {
  const _PaymentMethodsPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentMethods =
        context.select((UserBloc bloc) => bloc.user.paymentMethods);
    final defaultPaymentMethodID =
        context.select((UserBloc bloc) => bloc.user.defaultPaymentMethod?.id);

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ...paymentMethods.map(
        (method) => _PaymentMethod(
          method,
          selected: method.id == defaultPaymentMethodID,
          onPressed: () => context
              .read<PaymentMethodsBloc>()
              .add(PaymentMethodsEvent.paymentMethodSelected(method.id)),
          onCostCenterSelected: (center) => context
              .read<PaymentMethodsBloc>()
              .add(PaymentMethodsEvent.costCenterSelected(method.id, center)),
        ),
      )
      // .toList(),
    ]);
  }
}

class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod(
    this.paymentMethod, {
    this.selected = false,
    this.onPressed,
    required this.onCostCenterSelected,
    Key? key,
  }) : super(key: key);

  final PaymentMethod paymentMethod;
  final bool selected;
  final VoidCallback? onPressed;
  final ValueChanged<String> onCostCenterSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const Padding4.vertical(),
        child: paymentMethod.map(
          cb: (cb) => _CBPaymentMethod(
            cb,
            selected: selected,
            onPressed: onPressed,
          ),
          prepaid: (prepaid) => _PrepaidPaymentMethod(
            prepaid,
            selected: selected,
            onPressed: onPressed,
          ),
          company: (company) => _CompanyPaymentMethod(
            company,
            selected: selected,
            onCostCenterSelected: onCostCenterSelected,
            onRadioPressed: onPressed,
          ),
          onboarding: (onboarding) => _OnboardingPaymentMethod(
            onboarding,
            selected: selected,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

class _SelectedIcon extends StatelessWidget {
  const _SelectedIcon(
    this.selected, {
    Key? key,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return selected
        ? const Icon(
            Icons.radio_button_checked,
            size: _iconSize,
            color: Colors.black,
          )
        : const Icon(
            Icons.radio_button_off,
            size: _iconSize,
            color: Colors.black,
          );
  }
}
