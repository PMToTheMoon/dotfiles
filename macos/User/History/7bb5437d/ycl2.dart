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
      hoverColor: context.tbtColors.error.withOpacity(.47),
      focusColor: context.tbtColors.error.withOpacity(.47),
      icon: Icon(
        Icons.delete,
        color: context.tbtColors.error,
      ),
    );
  }
}
