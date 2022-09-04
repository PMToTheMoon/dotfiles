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

  void _buildMenuBouton(ContextualMenuButton item, OverlayEntry entry) {
    final onPressed = item.onPressed != null ? () {} : null;
    return MenuButton(
      onPressed: onPressed,
      child: item.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContextualMenu(
      icon: Icon(icon),
      builder: (context, entry) => Card(
        child: Padding(
          padding: padding,
          child: Column(
            children: children
                .map<Widget>(
                  (item) => MenuButton(
                    onPressed: () {
                      entry.remove();
                      item.onPressed?.call();
                    },
                    child: item.child,
                  ),
                )
                .intersperse(
                  SizedBox(
                    height: spacing,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      menu: Card(
        child: Padding(
          padding: padding,
          child: Column(
            children: children
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
    required this.menu,
    required this.builder,
    super.key,
  });

  final Widget icon;
  final Widget menu;
  final Widget Function(BuildContext context, OverlayEntry entry) builder;

  @override
  ContextualMenuState createState() => ContextualMenuState();
}

class HideContextualMenu extends Intent {
  const HideContextualMenu();
}

class ContextualMenuState extends State<ContextualMenu> {
  ContextualMenuState();

  final FocusNode _focusNode = FocusNode();
  final _iconKey = GlobalKey();

  late final _entry = OverlayEntry(
    builder: _buildMenu,
  );

  Widget _buildMenu(BuildContext overlayContext) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset offset = box.localToGlobal(Offset.zero);
    Rect anchor = offset & box.size;
    return _PositionedMenu(
      anchor: anchor,
      child: widget.builder(context, _entry),
    );
  }

  void _showMenu() {
    _focusNode.requestFocus();
    Overlay.of(context)?.insert(_entry);
  }

  void _hideMenu() {
    _entry.remove();
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
      actions: {
        HideContextualMenu: CallbackAction(onInvoke: (_) => _hideMenu())
      },
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
    super.key,
    required this.anchor,
    required this.child,
  });

  final Rect anchor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: anchor.top + (anchor.height / 2),
      right: anchor.left,
      child: child,
    );
  }
}
