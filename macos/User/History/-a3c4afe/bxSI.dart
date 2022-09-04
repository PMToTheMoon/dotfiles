import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

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
      onTap: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: _showBorder
              ? context.tbtColors.blueHover
              : context.colorScheme.secondary,
          decoration: _showBorder ? TextDecoration.underline : null,
        ),
      ),
    );
  }
}
