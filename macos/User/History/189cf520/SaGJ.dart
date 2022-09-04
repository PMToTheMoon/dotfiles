import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.loading,
    required this.onPressed,
    super.key,
  });

  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: ButtonLoadingIndicator(),
    );
  }
}
