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

  final BorderSide? highlightSide;
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
    BorderSide? side;
    if (_focused) return widget.focusSide ?? widget.hoverSide ?? ;
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
