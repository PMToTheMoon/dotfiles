import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_account_bloc.dart';

/// You must insert UserAccountBloc in the widget tree in order to use
/// this widget
///
/// TODO: proper placeholder
class UserAvatarBuilder extends StatelessWidget {
  const UserAvatarBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(ImageProvider) builder;

  @override
  Widget build(BuildContext context) {
    final accountState = context.select((UserAccountBloc bloc) => bloc.state);

    final avatar = accountState.whenOrNull(
          ready: (account) => account.urlPicture != null
              ? NetworkImage(account.urlPicture!)
              : null,
        ) ??
        const NetworkImage(
          'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
        );
    return builder(avatar);
  }
}
