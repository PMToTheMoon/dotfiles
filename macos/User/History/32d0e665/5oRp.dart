import 'package:common/src/widgets/chips/info_chip.dart';

class SuareChip extends StatelessWidget {
  const SuareChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoChip(
      backgroundColor: backgroundColor,
      padding: padding,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
