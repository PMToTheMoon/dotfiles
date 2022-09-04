part of 'payment_methods_page.dart';

class _CompanyPaymentMethod extends StatelessWidget {
  const _CompanyPaymentMethod(
    this.payment, {
    this.selected = false,
    required this.onCostCenterSelected,
    Key? key,
  }) : super(key: key);

  final CompanyPaymentMethod payment;
  final bool selected;
  final ValueChanged<String> onCostCenterSelected;

  List<DropdownMenuItem<String>> _dropdownItems(BuildContext context) =>
      payment.availableCostCenters
          .map((costCenter) => DropdownMenuItem(
                child: Text(costCenter),
                value: costCenter,
              ))
          .toList();

  void _onCostCenterSelected(String? center) {
    if (center != null && center != payment.costCenter) {
      onCostCenterSelected(center);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.domain,
          size: _iconSize,
        ),
        const Space4.w(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
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
              ),
              if (payment.availableCostCenters.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        value: payment.costCenter,
                        selectedItemBuilder: (context) =>
                            payment.availableCostCenters
                                .map((costCenter) => Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${context.l10n.cost_center_label}: ${payment.costCenter}",
                                      ),
                                    ))
                                .toList(),
                        hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(context.l10n.cost_center_hint),
                        ),
                        items: _dropdownItems(context),
                        onChanged: _onCostCenterSelected,
                        underline: const SizedBox.shrink(),
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
