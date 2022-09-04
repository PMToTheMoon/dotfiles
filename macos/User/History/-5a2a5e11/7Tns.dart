import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TbtHoverCard extends StatelessWidget {
  const TbtHoverCard({
    super.key,
    this.child,
    this.actions,
    this.shortcuts,
  });

  final Widget? child;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      side: BorderSide.none,
      focusSide: BorderSide(color: context.colorScheme.primary),
      hoverSide: BorderSide(color: context.colorScheme.primary),
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
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
    this.actions,
    this.shortcuts,
    this.child,
  });

  final BorderSide? focusSide;
  final BorderSide? hoverSide;
  final BorderSide side;
  final BorderRadius? borderRadius;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
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
      child: InkWell(
        onTap: () {},
        child: BorderCard(
          side: side,
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}
