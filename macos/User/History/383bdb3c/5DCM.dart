import 'package:common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:neat/neat.dart';
import 'package:translations/translations.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    this.onMyProfilePressed,
    this.onPersonalInformationPressed,
    this.onDocumentsPressed,
    this.onLogoutPressed,
    this.onExitHoverRegion,
    this.hoverRegionMargin = EdgeInsets.zero,
    super.key,
  });

  final EdgeInsetsGeometry hoverRegionMargin;
  final void Function(PointerExitEvent)? onExitHoverRegion;
  final VoidCallback? onMyProfilePressed;
  final VoidCallback? onPersonalInformationPressed;
  final VoidCallback? onDocumentsPressed;
  final VoidCallback? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: onExitHoverRegion,
      child: Padding(
        padding: hoverRegionMargin,
        child: SizedBox(
          // width: 264,
          child: Card(
            surfaceTintColor: context.colorScheme.surface,
            color: context.colorScheme.surface,
            elevation: 5,
            child: Padding(
              padding: const PaddingSmaller(),
              child: IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _PopoverMenuItem(
                      onPressed: onMyProfilePressed,
                      text: context.l10n.profile_popover_profile_button,
                      suffixIcon: Icons.arrow_right,
                    ),
                    _PopoverMenuItem(
                      onPressed: onPersonalInformationPressed,
                      text: context.l10n.profile_popover_personal_information,
                      suffixIcon: Icons.arrow_right,
                    ),
                    _PopoverMenuItem(
                      onPressed: onDocumentsPressed,
                      text: context.l10n.profile_popover_documents_button,
                      suffixIcon: Icons.arrow_right,
                    ),
                    MenuButton(
                      onPressed: onLogoutPressed,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          context.l10n.profile_popover_logout_button,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PopoverMenuItem extends StatefulWidget {
  const _PopoverMenuItem({
    super.key,
    required this.text,
    this.suffixIcon,
    this.onPressed,
  });

  final String text;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;

  @override
  _PopoverMenuItemState createState() => _PopoverMenuItemState();
}

class _PopoverMenuItemState extends State<_PopoverMenuItem> {
  bool _hovered = false;

  Widget _buildText() {
    return Text(
      widget.text,
      style: TextStyle(
        fontWeight: _hovered ? FontWeight.w600 : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (widget.suffixIcon != null && _hovered) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildText(),
          Icon(
            widget.suffixIcon,
          ),
        ],
      );
    } else {
      content = Align(
        alignment: Alignment.centerLeft,
        child: _buildText(),
      );
    }

    return FocusableActionDetector(
      onShowHoverHighlight: (hovered) => setState(() {
        _hovered = hovered;
      }),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          padding: const PaddingSmall().msp,
          foregroundColor: context.colorScheme.onSurface.msp,
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return context.colorScheme.primary;
            }
            if (states.contains(MaterialState.hovered)) {
              return context.colorScheme.primaryContainer;
            }
            return Colors.transparent;
          }),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
          ).msp,
        ),
        child: content,
      ),
    );
  }
}
