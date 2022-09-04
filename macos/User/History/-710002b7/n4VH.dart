part of 'payment_methods_page.dart';

class _CBPaymentMethod extends StatelessWidget {
  const _CBPaymentMethod(
    this.payment, {
    this.selected = false,
    Key? key,
  }) : super(key: key);

  final CBPaymentMethod payment;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.payment,
          size: _iconSize,
        ),
        const Space4.w(),
        Expanded(
          child: context.subtitle2(
            "${payment.label.toCapitalized} **** ${payment.lastNumbers}",
          ),
        ),
        Radio<bool>(
          groupValue: true,
          value: selected,
          onChanged: (_) => onPressed?.call(),
          activeColor: context.colorScheme.primary,
        ),
      ],
    );
  }
}
