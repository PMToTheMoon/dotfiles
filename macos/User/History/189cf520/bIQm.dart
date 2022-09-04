import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.loading,
    required this.onPressed,
    required this.child,
    super.key,
  });

  final bool loading;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: loading ? const ButtonLoadingIndicator() : child,
    );
  }
}
