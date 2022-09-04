import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: ButtonLoadingIndicator(),
    );
  }
}
