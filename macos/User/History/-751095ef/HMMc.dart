import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

AppBar titleSubtitleAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) =>
    AppBar(
      centerTitle: true,
      title: Column(children: [
        context.bodyMedium(subtitle),
        Text(title),
      ]),
    );

AppBar titleAppBar(
  BuildContext context,
  String title,
) =>
    AppBar(
      centerTitle: true,
      title: Text(title),
    );

AppBar titleSubtitleAvatarAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) =>
    AppBar(
      centerTitle: true,
      title: Column(children: [
        context.bodyMedium(subtitle),
        Text(title),
      ]),
      actions: [
        CircleAvatar(
          foregroundImage: AssetImage(Assets.images.launcherIcon.keyName),
          radius: Dimensions.sizeSmall / 2,
        ),
        const SpaceSmall.w(),
      ],
    );

class HomeAppBar extends AppBar {
  HomeAppBar(
    BuildContext context, {
    required String firstName,
  }) : super(
          centerTitle: false,
          titleSpacing: Dimensions.paddingPageMedium,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.bodyMedium('Bonjour'),
              FittedBox(
                child: context.headlineLarge('Docteur $firstName 👋'),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Container(
                // padding: const PaddingSmaller(),
                height: Dimensions.sizeMedium,
                width: Dimensions.sizeMedium,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Dimensions.borderRadiusMedium),
                  color: context.colorScheme.surfaceVariant,
                ),
                child: Icon(
                  Zanalys.bell,
                  size: Dimensions.iconMedium,
                ),
              ),
            ),
            const SpaceSmall.w(),
          ],
        );

  @override
  Size get preferredSize => Size.fromHeight(79);
}

// AppBar homeAppBar(
//   BuildContext context, {
//   required String firstName,
// }) =>
//     AppBar(
//       centerTitle: false,
//       titleSpacing: Dimensions.paddingPageMedium,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           context.bodyMedium('Bonjour'),
//           FittedBox(
//             child: context.headlineLarge('Docteur $firstName 👋'),
//           ),
//         ],
//       ),
//       actions: [
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             // padding: const PaddingSmaller(),
//             height: Dimensions.sizeMedium,
//             width: Dimensions.sizeMedium,
//             decoration: BoxDecoration(
//               borderRadius:
//                   BorderRadius.circular(Dimensions.borderRadiusMedium),
//               color: context.colorScheme.surfaceVariant,
//             ),
//             child: Icon(
//               Zanalys.bell,
//               size: Dimensions.iconMedium,
//             ),
//           ),
//         ),
//         const SpaceSmall.w(),
//       ],
//     );
