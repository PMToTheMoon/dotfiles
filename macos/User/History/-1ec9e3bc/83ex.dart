import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

class ContextualMenuButton {
  const ContextualMenuButton({
    this.onPressed,
    required this.child,
  });

  // final GlobalKey ref;
  final VoidCallback? onPressed;
  final Widget child;
}

class TbtIconMenu extends StatelessWidget {
  const TbtIconMenu({
    required this.icon,
    required this.children,
    this.spacing = Dimensions.spaceSmall,
    this.padding = const PaddingSmaller(),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Dimensions.borderRadiusSmall),
    ),
    super.key,
  });

  final IconData icon;
  final List<ContextualMenuButton> children;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  Widget _buildMenuButton(ContextualMenuButton item, hideMenu) {
    final onPressed = item.onPressed != null
        ? () async {
            await Future.delayed(Feel.durationFast);
            hideMenu();
            item.onPressed?.call();
          }
        : null;
    return MenuButton(
      onPressed: onPressed,
      child: item.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContextualMenu(
      icon: Icon(icon),
      builder: (context, hideMenu) => Card(
        child: Padding(
          padding: padding,
          child: Column(
            children: children
                .map<Widget>((item) => _buildMenuButton(item, hideMenu))
                .intersperse(
                  SizedBox(
                    height: spacing,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ContextualMenu extends StatefulWidget {
  const ContextualMenu({
    required this.icon,
    required this.builder,
    super.key,
  });

  final Widget icon;

  final Widget Function(BuildContext context, VoidCallback hideMenu) builder;

  @override
  ContextualMenuState createState() => ContextualMenuState();
}

class ContextualMenuState extends State<ContextualMenu> {
  ContextualMenuState();

  final FocusNode _focusNode = FocusNode();
  final _iconKey = GlobalKey();

  late final _entry = OverlayEntry(
    builder: _buildMenu,
  );

  bool _menuDisplayed = false;

  Widget _buildMenu(BuildContext overlayContext) {
    RenderBox box = _iconKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = box.localToGlobal(Offset.zero);
    Rect anchor = offset & box.size;
    return _PositionedMenu(
      anchor: anchor,
      child: widget.builder(context, _hideMenu),
    );
  }

  void _showMenu() {
    if (_menuDisplayed == false) {
      _menuDisplayed = true;

      _focusNode.requestFocus();
      Overlay.of(context)?.insert(_entry);
    }
  }

  void _hideMenu() {
    if (_menuDisplayed == true) {
      _menuDisplayed = false;
      _entry.remove();
    }
  }

  void _onPressed() {
    _showMenu();
  }

  void _onLoseFocus() {
    _hideMenu();
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      onFocusChange: (focus) {
        if (focus == false) {
          _onLoseFocus();
        }
      },
      child: IconButton(
        key: _iconKey,
        focusNode: _focusNode,
        onPressed: _onPressed,
        icon: widget.icon,
      ),
    );
  }
}

class _PositionedMenu extends StatelessWidget {
  const _PositionedMenu({
    required this.anchor,
    required this.child,
  });

  final Rect anchor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: anchor.top + (anchor.height / 2),
      left: anchor.center.dx,
      child: child,
    );
  }
}
