import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:provider/provider.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/user/user_account/user_account.dart';

class CandidateAppBar extends StatelessWidget with PreferredSizeWidget {
  const CandidateAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accountState = context.select((UserAccountBloc bloc) => bloc.state);

    final avatar = accountState.whenOrNull(
      ready: (account) => account.urlPicture != null ? NetworkImage(account.urlPicture!) : const NetworkImage(
        'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
      ),
    );

    return TbtAppBar(
      onMyProfilePressed: () => RouteState.of(context).goTo('/profile'),
      onLogoutPressed: () => context.read<AuthBloc>().logout(),
      avatar: 
    );
  }

  @override
  Size get preferredSize => TbtAppBar.defaultPreferredSize;
}
