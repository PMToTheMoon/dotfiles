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
      icon: const Icon(
        Icons.delete,
        size: Dimensions.iconMedium,
      ),
    );
  }
}
