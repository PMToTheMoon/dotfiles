import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:popover/popover.dart';

class TbtAppBar extends StatelessWidget with PreferredSizeWidget {
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

  void _showProfilePopover(BuildContext avatarContext) {
    showPopover(
      context: avatarContext,
      contentDyOffset: Dimensions.spaceMedium,
      bodyBuilder: (ctx) => ProfilePopover(
        onMyProfilePressed: onMyProfilePressed,
        onPersonalInformationPressed: onPersonalInformationPressed,
        onDocumentsPressed: onDocumentsPressed,
        onLogoutPressed: onLogoutPressed,
      ),
    );
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
                controller: searchController,
                onChanged: onSearch,
                onEditingComplete: onSearchEditingComplete,
              ),
            ),
            const Spacer(),
            NotificationBell(
              notifications: notificationNumber,
            ),
            const SpaceSmaller.w(),
            Builder(builder: (avatarContext) {
              return InkWell(
                onTap: () => _showProfilePopover(avatarContext),
                child: CircleAvatar(
                  radius: 16,
                  foregroundImage: avatar,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => defaultPreferredSize;
}
