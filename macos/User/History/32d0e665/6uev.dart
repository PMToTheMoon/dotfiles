import 'package:common/src/widgets/chips/info_chip.dart';

class SuareChip extends StatelessWidget {
  const SuareChip(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return InfoChip(
      backgroundColor: backgroundColor,
      padding: padding,
      borderRadius: borderRadius,
      child: context.labelMedium(label),
    );
  }
}
