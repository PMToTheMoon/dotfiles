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
  bool _showBorder = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(widget.text),
    );
  }
}
