import 'package:common/common.dart';
import 'package:flutter/material.dart';

// class TabCardView extends StatelessWidget {
//   const TabCardView({
//     super.key,
//     required this.tabs,
//     required this.children,
//     this.tabBarPadding,
//   });

//   final List<String> tabs;
//   final List<Widget> children;
//   final EdgeInsets? tabBarPadding;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TbtTabBar(
//           tabs: tabs,
//           tabBarPadding: tabBarPadding,
//         ),
//         Expanded(
//           child: ClipRect(
//             child: Card(
//               margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
//               child: TabBarView(children: children),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

class TabCard extends StatelessWidget {
  const TabCard({
    super.key,
    required this.tabs,
    required this.child,
    this.tabBarPadding,
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
          child: TbtTabBar(
            // controller: controller,
            onTap: onTabSelected,
            tabs: tabs,
            tabBarPadding: tabBarPadding,
          ),
        ),
        Expanded(
          child: ClipRect(
            child: Card(
              margin: cardMargin,
              child: child,
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
