import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _showBorder = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHighlightChanged: (v) => setState(() => _showBorder = v),
      customBorder: Border(bottom: BorderSide(width: 1)),
      onTap: widget.onPressed,
      child: Text(widget.text),
    );
  }
}
