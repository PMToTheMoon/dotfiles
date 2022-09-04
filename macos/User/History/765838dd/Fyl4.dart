import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';

class CandidateAppBar extends StatelessWidget with PreferredSizeWidget {
  const CandidateAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TbtAppBar(
      onMyProfilePressed: () {
        Navigator.of(context).pop();
        RouteState.of(context).goTo('/profile');
      },
      onLogoutPressed: (ctx) {
        // Navigator.of(context).pop();
        ctx.read<AuthBloc>().logout();
      },
      avatar: NetworkImage(
        'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
      ),
    );
  }

  @override
  Size get preferredSize => TbtAppBar.defaultPreferredSize;
}
