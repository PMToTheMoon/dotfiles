part of 'payment_methods_page.dart';

class _PrepaidPaymentMethod extends StatelessWidget {
  const _PrepaidPaymentMethod(
    this.payment, {
    this.selected = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final PrepaidPaymentMethod payment;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.card_giftcard,
          size: _iconSize,
        ),
        const Space4.w(),
        Expanded(
          child: context.subtitle2(
            "${context.l10n.payment_methods_prepaid} ${payment.balance}€",
          ),
        ),
        Radio<bool>(
          groupValue: true,
          value: selected,
          onChanged: (_) => onPressed?.call(),
          // activeColor: context.colorScheme.primary,
        ),
      ],
    );
  }
}
