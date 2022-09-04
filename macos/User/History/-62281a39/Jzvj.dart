import 'package:flutter/material.dart';

class UserAvatarBuilder extends StatelessWidget {
  const UserAvatarBuilder({
    super.key,
  });

  Widget Function(ImageProvider) builder;

  @override
  Widget build(BuildContext context) {
    final avatar = accountState.whenOrNull(
          ready: (account) => account.urlPicture != null
              ? NetworkImage(account.urlPicture!)
              : null,
        ) ??
        const NetworkImage(
          'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
        );
  }
}
