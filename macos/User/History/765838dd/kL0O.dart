import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

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
      avatar: NetworkImage(
        'https://img.freepik.com/free-photo/dreamy-young-woman-sunglasses-looking-front_197531-16739.jpg',
      ),
    );
  }

  @override
  Size get preferredSize => TbtAppBar.defaultPreferredSize;
}
