import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      hoverColor: context.tbtColors.errorContainer.withOpacity(.47),
      focusColor: context.tbtColors.errorContainer.withOpacity(.47),
      splashColor: context.tbtColors.error.withOpacity(.47),
      icon: Icon(
        Icons.delete,
        color: onPressed != null
            ? context.tbtColors.error
            : context.tbtColors.disabled,
      ),
    );
  }
}
