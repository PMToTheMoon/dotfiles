import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

List<Widget> chips(BuildContext context) => [
      Wrap(
        spacing: 10,
        children: [
          InputChip(
            label: const Text('Résolution des problèmes'),
            onDeleted: () {},
          ),
          const OrangeAccentTextChip('label'),
          const TextChip('label'),
          IconTextChip.small(
            icon: Icons.check,
            text: 'Profile placé',
            iconColor: context.tbtColors.success,
            backgroundColor: context.tbtColors.successContainer,
          ),
          SizedBox(
            width: 195,
            child: IconTextChip(
              icon: Icons.check,
              text: 'Recruté',
              width: 95,
              iconColor: context.tbtColors.success,
              backgroundColor: context.tbtColors.successContainer,
            ),
          ),
          RectChip('Text'),
          RectChip('Sass'),
          RectChip('Tagada'),
        ],
      ),
      const IconText(Icons.access_alarm, 'icon text'),
      const ColoredIconText.darkBlue(Icons.access_alarm, 'darkBlue icon text'),
      const ColoredIconText.mediumBlue(
          Icons.access_alarm, 'mediumBlue icon text'),
      const ColoredIconText.lightBlue(
          Icons.access_alarm, 'lightBlue icon text'),
      const ColoredIconText.darkPurple(
          Icons.access_alarm, 'darkPurple icon text'),
      const ColoredIconText.mediumPurple(
          Icons.access_alarm, 'mediumPurple icon text'),
      const EmojiText('💻', 'emoji text'),
    ];
