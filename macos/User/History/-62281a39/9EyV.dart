import 'package:flutter/material.dart';

class UserAvatarView extends StatelessWidget {
  const UserAvatarView({
    super.key,
  });

  Widget Function(ImageProvider) builder;

  @override
  Widget build(BuildContext context) {
    return const Text('UserAvatarView');
  }
}
