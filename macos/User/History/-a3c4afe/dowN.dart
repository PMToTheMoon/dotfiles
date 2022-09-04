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
  final VoidCallback? onPressed;

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _focused = false;
  bool _hovered = false;
  bool get _showBorder => _focused || _hovered;

  Color get _color {
    if (widget.onPressed == null) return context.tbtColors.disabled;
    if (_showBorder) return context.tbtColors.blueHover;
    context.colorScheme.secondary;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
