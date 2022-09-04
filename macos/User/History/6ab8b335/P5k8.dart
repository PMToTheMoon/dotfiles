import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
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

const _pages = {
  ZanalysBottomNavigationTab.home: HomePage(),
  ZanalysBottomNavigationTab.patient: UIKitPage(),
};

class HubPageState extends State<HubPage> {
  HubPageState();

  // final PageController pageController = PageController(
  //   initialPage: _kInitialPage.index,
  // );
  ZanalysBottomNavigationTab currentTab = _kInitialPage;

  // void _onPageChanged(int page) {
  //   setState(() {
  //     currentTab = ZanalysBottomNavigationTab.values[page];
  //   });
  // }

  void _onBottomTabSelected(ZanalysBottomNavigationTab tab) {
    // pageController.animateToPage(
    //   tab.index,
    //   duration: Feel.durationMedium,
    //   curve: Feel.curveMedium,
    // );
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
            //   controller: pageController,
            //   onPageChanged: _onPageChanged,
            //   children: const [
            //     HomePage(),
            //     UIKitPage(),
            //   ],
            // ),
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

// class AnimatedAppBarSwitcher extends StatelessWidget
//     implements PreferredSizeWidget {
//   const AnimatedAppBarSwitcher({
//     Key? key,
//     required this.appBar,
//   }) : super(key: key);

//   final AppBar appBar;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: Feel.durationMedium,
//       switchInCurve: Feel.curveMedium,
//       switchOutCurve: Feel.curveMedium,
//       child: appBar,
//     );
//   }

//   @override
//   Size get preferredSize => appBar.preferredSize;
// }
