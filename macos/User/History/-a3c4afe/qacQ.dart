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
  bool _focused = false;
  bool _hovered = false;
  bool get _showBorder => _focused || _hovered;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (focus) => setState(() {
        _focused = focus;
      }),
      onHover: (hover) => setState(() {
        _hovered = hover;
      }),
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
