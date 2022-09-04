import 'package:flutter/material.dart';

class PrefixedText extends StatelessWidget {
  const PrefixedText({
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Spacer(),
        Text(data),
      ],
    );
  }
}
