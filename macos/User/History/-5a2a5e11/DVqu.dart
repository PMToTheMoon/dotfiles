import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    this.hoverSide,
    required this.side,
    this.borderRadius,
    this.child,
  });

  final BorderSide? focusSide;
  final BorderSide? hoverSide;
  final BorderSide side;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;
  bool _focused = false;

  BorderSide get side {
    if (_focused) return widget.focusSide ?? side;
    if (_hovered) return widget.hoverSide ?? side;
    return widget.side;
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onShowHoverHighlight: (hovered) => setState(() {
        _hovered = hovered;
      }),
      onShowFocusHighlight: (focused) => setState(() {
        _focused = focused;
      }),
      child: BorderCard(
        side: side,
        borderRadius: widget.borderRadius,
        child: widget.child,
      ),
    );
  }
}
