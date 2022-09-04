part of 'payment_methods_page.dart';

class _OnboardingPaymentMethod extends StatelessWidget {
  const _OnboardingPaymentMethod(
    this.payment, {
    this.selected = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final OnboardingPaymentMethod payment;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.domain,
          size: _iconSize,
        ),
        const Space4.w(),
        Expanded(
          child: context.subtitle2(
            payment.company,
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
