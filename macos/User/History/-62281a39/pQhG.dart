import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user_account_bloc.dart';

const _kPlaceholderUrl =
    'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg';

/// You must insert UserAccountBloc in the widget tree in order to use
/// this widget
///
/// TODO: proper placeholder
class UserAvatarBuilder extends StatelessWidget {
  const UserAvatarBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(ImageProvider) builder;

  @override
  Widget build(BuildContext context) {
    final accountState = context.select((UserAccountBloc bloc) => bloc.state);

    final avatarUrl = accountState.whenOrNull(
      ready: (account) => account.urlPicture,
    );

    return _UserAvatarBuilder(
      builder: builder,
      avatarUrl: avatarUrl,
    );
  }
}

class _UserAvatarBuilder extends StatefulWidget {
  const _UserAvatarBuilder({
    required this.builder,
    this.avatarUrl,
  });

  final String? avatarUrl;

  final Widget Function(ImageProvider) builder;

  @override
  State<_UserAvatarBuilder> createState() => _UserAvatarBuilderState();
}

class _UserAvatarBuilderState extends State<_UserAvatarBuilder> {
  String? _avatarUrl;

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    if (widget.avatarUrl != null) {
      _avatarUrl = widget.avatarUrl;
    }
  }

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    if (widget.avatarUrl != null) {
      _avatarUrl = widget.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      NetworkImage(
        _avatarUrl ?? _kPlaceholderUrl,
      ),
    );
  }
}
