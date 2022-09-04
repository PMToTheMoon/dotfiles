import 'package:flutter/material.dart';

class LinkButton extends StatefulWidget {
  const LinkButton({
    this.text,
    super.key,
  });

  final String text;
  final VoidCallback onTap;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _showBorder = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Text(widget.text),
    );
  }
}
