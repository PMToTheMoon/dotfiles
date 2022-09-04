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

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: tbtFeedback(
          idle: Colors.transparent,
          pressed: context.tbtColors.secondary.withOpacity(.47),
          emphasized: context.tbtColors.secondaryContainer,
        ),
        side: tbtFeedback(
          idle: BorderSide(color: context.colorScheme.secondary),
        ),
      ),
      child: IconText(
        Icons.save,
        context.l10n.search_bar_hint,
        iconColor: context.tbtColors.secondary,
        textStyle: TextStyle(
          color: context.tbtColors.secondary,
        ),
      ),
    );
  }
}
