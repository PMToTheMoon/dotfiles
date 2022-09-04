import 'package:flutter/material.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.delete,
      ),
    );
  }
}
