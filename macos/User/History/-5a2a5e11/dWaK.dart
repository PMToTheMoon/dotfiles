import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TbtHoverCard extends StatelessWidget {
  const TbtHoverCard({
    super.key,
    this.child,
    this.onTap,
  });

  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      side: BorderSide.none,
      focusSide: BorderSide(color: context.colorScheme.primary),
      hoverSide: BorderSide(color: context.colorScheme.primary),
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
      onTap: onTap,
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
    this.onTap,
    this.child,
  });

  final BorderSide? focusSide;
  final BorderSide? hoverSide;
  final BorderSide side;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
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
        // _hovered = hovered;
      }),
      onShowFocusHighlight: (focused) => setState(() {
        // _focused = focused;
      }),
      child: BorderCard(
        side: side,
        borderRadius: widget.borderRadius,
        child: InkWell(
          hoverColor: Colors.red,
          borderRadius: widget.borderRadius,
          onTap: widget.onTap,
          child: widget.child,
        ),
      ),
    );
  }
}
