import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/home/view/home_page.dart';
import 'package:zanalys/hub/hub.dart';

const _kInitialPage = ZanalysBottomNavigationTab.patient;

/// Root page for all page accessible via bottom bar
class HubPage extends StatefulWidget {
  static const route = 'hub';

  static HubPage builder(BuildContext context) => const HubPage();

  const HubPage({
    Key? key,
  }) : super(key: key);

  @override
  HubPageState createState() => HubPageState();
}

const _pages = {
  ZanalysBottomNavigationTab.home: HomePage(),
  ZanalysBottomNavigationTab.patient: UIKitPage(),
  ZanalysBottomNavigationTab.picture: PicturePage(),
};

class HubPageState extends State<HubPage> {
  HubPageState();

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
            child: AnimatedSwitcher(
              duration: Feel.durationMedium,
              switchInCurve: Feel.curveMedium,
              switchOutCurve: Feel.curveMedium,
              child: _pages[currentTab],
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
