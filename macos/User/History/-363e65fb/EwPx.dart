import 'package:common/common.dart';
import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: tbtFeedback(
          idle: Colors.transparent,
          pressed: context.tbtColors.error.withOpacity(.47),
          emphasized: context.colorScheme.errorContainer.withOpacity(.47),
        ),
        side: tbtFeedback(
          pressed: BorderSide(color: context.tbtColors.error),
          emphasized: BorderSide(color: context.tbtColors.error),
        ),
      ),
      child: IconText(
        Icons.delete,
        context.l10n.delete,
        iconColor: context.colorScheme.error,
      ),
    );
  }
}
