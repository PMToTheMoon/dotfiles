import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({
    this.text,
    super.key,
  });

  final String text;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _showBorder;

  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}
