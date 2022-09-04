// ignore_for_file: always_declare_return_types

import 'package:common/common.dart';
import 'package:common/src/widgets/tab_bars.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
// import 'ui_kit_body.dart';

class UIKitPage extends StatelessWidget {
  const UIKitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.background,
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: 'UI Kit',
        subtitle: 'Debug view',
        image: AssetImage(Assets.images.launcherIcon.keyName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const PaddingPageMedium.horizontal(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ..._buildTexts(context),
                const SpaceMedium(),
                _buildIcons(context),
                const SpaceMedium(),
              ],
            ),
          ),
          const DefaultTabController(
            length: 3,
            child: UnderlineTabBar(
              tabs: ['En cours', 'Prioritaire', 'Brouillon'],
            ),
          ),
          const SpaceMedium(),
          const DefaultTabController(
            length: 3,
            child: HighlightTabBar(
              tabs: ['En cours', 'Prioritaire', 'Brouillon'],
            ),
          ),
          const SpaceMedium(),
        ],
      ),
    );
  }

  _buildTexts(BuildContext context) => [
        context.displayLarge('Display large'),
        context.headlineLarge('Headline Large'),
        context.titleLarge('Title Large'),
        context.bodyLarge('Body Large'),
        context.labelLarge('Label Large'),
        const SpaceSmall(),
        context.displayMedium('Display Medium'),
        context.headlineMedium('Headline Medium'),
        context.titleMedium('Title Medium'),
        context.bodyMedium('Body Medium'),
        context.labelMedium('Label Medium'),
        const SpaceSmall(),
        context.displaySmall('Display Small'),
        context.headlineSmall('Headline Small'),
        context.titleSmall('Title Small'),
        context.bodySmall('Body Small'),
        context.labelSmall('Label Small'),
      ];

  _buildIcons(BuildContext context) => Wrap(
        spacing: Dimensions.spaceSmall,
        children: const [
          Icon(FeatherIcons.home),
          Icon(FeatherIcons.calendar),
          Icon(FeatherIcons.folder),
          Icon(FeatherIcons.messageCircle),
          Icon(FeatherIcons.user),
          Icon(FeatherIcons.users),
          Icon(Zanalys.bell),
          Icon(Zanalys.calendar),
          Icon(Zanalys.folder),
          Icon(Zanalys.home),
          Icon(Zanalys.message),
          Icon(Zanalys.profile),
        ],
      );

  _buildRecordCards(BuildContext context) => [
        RecordCard(
          data: RecordCardData.withEditButton(
            firstName: firstName,
            lastName: lastName,
            image: image,
          ),
        ),
      ];
}
