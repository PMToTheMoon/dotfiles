import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:popover/popover.dart';

class TbtAppBar extends StatefulWidget with PreferredSizeWidget {
  static const defaultPreferredSize = Size(double.infinity, 70);

  const TbtAppBar({
    this.notificationNumber = 0,
    required this.avatar,
    this.searchController,
    this.onSearch,
    this.onSearchEditingComplete,
    this.onMyProfilePressed,
    this.onPersonalInformationPressed,
    this.onDocumentsPressed,
    this.onLogoutPressed,
    super.key,
  });

  final int notificationNumber;
  final ImageProvider avatar;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onSearchEditingComplete;
  final VoidCallback? onMyProfilePressed;
  final VoidCallback? onPersonalInformationPressed;
  final VoidCallback? onDocumentsPressed;
  final VoidCallback? onLogoutPressed;

  @override
  State<TbtAppBar> createState() => _TbtAppBarState();

  @override
  Size get preferredSize => TbtAppBar.defaultPreferredSize;
}

class _TbtAppBarState extends State<TbtAppBar> {
  Future<void> _showProfilePopover(BuildContext avatarContext) async {
    await showPopover(
      context: avatarContext,
      contentDyOffset: Dimensions.spaceMedium,
      bodyBuilder: (ctx) => ProfilePopover(
        onMyProfilePressed: widget.onMyProfilePressed,
        onPersonalInformationPressed: widget.onPersonalInformationPressed,
        onDocumentsPressed: widget.onDocumentsPressed,
        onLogoutPressed: () {},
      ),
    );
    if (mounted) {
      Navigator.of(avatarContext).pop();
      // widget.onLogoutPressed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: context.colorScheme.shadow,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingPage,
          vertical: Dimensions.paddingSmaller,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 434,
              child: SearchBar(
                controller: widget.searchController,
                onChanged: widget.onSearch,
                onEditingComplete: widget.onSearchEditingComplete,
              ),
            ),
            const Spacer(),
            NotificationBell(
              notifications: widget.notificationNumber,
            ),
            const SpaceSmaller.w(),
            Builder(builder: (avatarContext) {
              return InkWell(
                onTap: () => _showProfilePopover(avatarContext),
                child: CircleAvatar(
                  radius: 16,
                  foregroundImage: widget.avatar,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
