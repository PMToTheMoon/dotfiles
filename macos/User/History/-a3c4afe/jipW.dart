import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({
    super.key,
  });

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _showBorder;

  @override
  Widget build(BuildContext context) {
    return const TextButton(onPressed: onPressed, child: child);
  }
}
