import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/user/user_account/user_account.dart';
import 'package:tech_by_tech/user/user_account/user_avatar_builder.dart';

class CandidateAppBar extends StatelessWidget with PreferredSizeWidget {
  const CandidateAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserAvatarBuilder(
      builder: (avatar) => TbtAppBar(
        onMyProfilePressed: () => RouteState.of(context).goTo('/profile'),
        onLogoutPressed: () => context.read<AuthBloc>().logout(),
        avatar: avatar,
      ),
    );
  }

  @override
  Size get preferredSize => TbtAppBar.defaultPreferredSize;
}
