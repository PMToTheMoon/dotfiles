import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  const TabCard({
    super.key,
    required this.tabs,
    required this.child,
    this.tabBarPadding = const PaddingMedium.horizontal(),
    this.margin = const PaddingMedium(),
    this.onTabSelected,
    this.controller,
  });

  final TabController? controller;
  final List<String> tabs;
  final Widget child;
  final EdgeInsets? tabBarPadding;
  final EdgeInsets margin;
  final ValueChanged<int>? onTabSelected;

  @override
  Widget build(BuildContext context) {
    final tabBarMargin = EdgeInsets.only(
      left: margin.left,
      right: margin.right,
      top: margin.top,
    );
    final cardMargin = EdgeInsets.only(
      left: margin.left,
      right: margin.right,
      bottom: margin.bottom,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: tabBarMargin,
          child: TbtCardTabBar(
            controller: controller,
            onTap: onTabSelected,
            tabs: tabs,
            tabBarPadding: tabBarPadding,
          ),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          margin: cardMargin,
          child: SizedBox(
            height: 900,
            child: TabBarView(
              controller: controller,
              children: [
                SizedBox.shrink(),
                child,
              ],
            ),
          ),
        )
      ],
    );
  }
}


// THIS APPROACH DOES'NT SCALE WELL WITH TEXT FACTOR

// const _kTabBarHeight = 46.0;

// class TabCard extends StatelessWidget {
//   const TabCard({
//     super.key,
//     required this.tabs,
//     required this.child,
//     this.tabBarPadding,
//   });

//   final List<String> tabs;
//   final Widget child;
//   final EdgeInsets? tabBarPadding;

//   @override
//   Widget build(BuildContext context) {
//     // //TODO: determine margin based on elevation and
//     // final cardMargin = 16;

//     return Stack(
//       // crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Positioned(
//           top: _kTabBarHeight,
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Card(
//             margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//             child: child,
//           ),
//         ),
//         Positioned(
//           top: 0,
//           child: TbtTabBar(
//             tabs: tabs,
//             tabBarPadding: tabBarPadding,
//           ),
//         ),
//       ],
//     );
//   }
// }
