import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TbtHoverCard extends StatelessWidget {
  const TbtHoverCard({
    super.key,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      side: side,
      child: child,
    );
  }
}

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    this.focusSide,
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
    BorderSide? highlightedSide;
    if (_focused) {
      highlightedSide = widget.focusSide;
    } else if (_hovered) {
      highlightedSide = widget.hoverSide;
    }
    return highlightedSide ?? widget.side;
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
