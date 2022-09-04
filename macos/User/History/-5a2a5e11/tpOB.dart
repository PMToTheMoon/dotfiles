import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TbtHoverCard extends StatelessWidget {
  const TbtHoverCard({
    super.key,
    this.child,
    this.onTap,
    this.onFocusChanged,
    this.onHoverChanged,
    this.actions,
  });

  final bool forceHighlight;
  final Widget? child;
  final VoidCallback? onTap;
  final void Function(bool)? onFocusChanged;
  final void Function(bool)? onHoverChanged;
  final Map<Type, Action<Intent>>? actions;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      side: BorderSide.none,
      focusSide: BorderSide(color: context.colorScheme.primary),
      hoverSide: BorderSide(color: context.colorScheme.primary),
      borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
      onFocusChanged: onFocusChanged,
      onHoverChanged: onHoverChanged,
      onTap: onTap,
      actions: actions,
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
    this.onFocusChanged,
    this.onHoverChanged,
    this.onTap,
    this.actions,
    this.child,
  });

  final BorderSide? focusSide;
  final BorderSide? hoverSide;
  final BorderSide side;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final void Function(bool)? onFocusChanged;
  final void Function(bool)? onHoverChanged;
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
      actions: widget.actions,
      onShowHoverHighlight: (hovered) {
        setState(() {
          _hovered = hovered;
        });
        widget.onHoverChanged?.call(hovered);
      },
      onShowFocusHighlight: (focused) {
        setState(() {
          _focused = focused;
        });
        widget.onFocusChanged?.call(focused);
      },
      child: BorderCard(
        side: side,
        borderRadius: widget.borderRadius,
        child: InkWell(
          overlayColor: Colors.transparent.msp,
          hoverColor: Colors.transparent,
          borderRadius: widget.borderRadius,
          onTap: widget.onTap,
          child: widget.child,
        ),
      ),
    );
  }
}
