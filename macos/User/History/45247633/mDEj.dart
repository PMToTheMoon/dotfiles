import 'package:common/common.dart';
import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
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
          disabled: context.tbtColors.disabled,
        ),
        side: tbtFeedback(
          disabled: BorderSide(color: context.tbtColors.disabled),
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
