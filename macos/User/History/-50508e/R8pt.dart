import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/home/home_root.dart';
import 'package:zanalys/patient/patient_root.dart';

import 'picture/view/picture_page.dart';

export 'root.dart';
export 'picture/picture.dart';

const _kInitialPage = ZanalysBottomNavigationTab.home;

/// Root page for all page accessible via bottom bar
class Root extends StatefulWidget {
  static const route = 'hub';

  static Root builder(BuildContext context) => const Root();

  const Root({
    Key? key,
  }) : super(key: key);

  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> {
  RootState();

  ZanalysBottomNavigationTab currentTab = _kInitialPage;

  void _onBottomTabSelected(ZanalysBottomNavigationTab tab) {
    setState(() {
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.colorScheme.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: IndexedStack(
              index: currentTab.index,
              children: const [
                HomeRoot(),
                PatientRoot(),
                PicturePage(),
                UIKitPage(),
              ],
            ),
          ),
          ZanalysBottomNavigationBar(
            currentTab: currentTab,
            onSelected: _onBottomTabSelected,
          ),
        ],
      ),
    );
  }
}
