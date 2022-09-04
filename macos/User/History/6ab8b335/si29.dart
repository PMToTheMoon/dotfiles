import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys/hub/home/view/home_page.dart';

const _kInitialPage = ZanalysBottomNavigationTab.home;

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

class HubPageState extends State<HubPage> {
  HubPageState();

  final PageController pageController = PageController(
    initialPage: _kInitialPage.index,
  );
  ZanalysBottomNavigationTab currentTab = _kInitialPage;


  void _onBottomTabSelected(ZanalysBottomNavigationTab tab) {
    pageController.animateToPage(
      tab.index,
      duration: Feel.durationMedium,
      curve: Feel.curveMedium,
    );
    setState(() {
      currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: ,
            children: const [
              HomePage(),
              UIKitPage(),
            ],
          ),
        ),
        ZanalysBottomNavigationBar(
          currentTab: currentTab,
          onSelected: _onBottomTabSelected,
        ),
      ],
    );
  }
}
