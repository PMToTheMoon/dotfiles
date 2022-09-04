import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import '../../theme/theme_data/color_scheme.dart';

class TabCardView extends StatelessWidget {
  const TabCardView({
    super.key,
    required this.tabs,
    required this.children,
    this.tabBarPadding,
  });

  final List<String> tabs;
  final List<Widget> children;
  final EdgeInsets? tabBarPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TbtTabBar(
          tabs: tabs,
          tabBarPadding: tabBarPadding,
        ),
        Expanded(
          child: ClipRect(
            child: Card(
              margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: TabBarView(children: children),
            ),
          ),
        )
      ],
    );
  }
}

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

//     return Material(
//       elevation: 3,
//       // shadowColor: context.colorScheme.shadow,
//       color: Colors.transparent,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TbtTabBar(
//             tabs: tabs,
//             tabBarPadding: tabBarPadding,
//           ),
//           Expanded(
//             child: Card(
//               margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//               child: child,
//               elevation: 0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


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
