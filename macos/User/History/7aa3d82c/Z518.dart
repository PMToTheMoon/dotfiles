import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

List<Widget> chips(BuildContext context) => [
      ChipTheme(
        data: ChipThemeData(
          backgroundColor: context.colorScheme.secondaryContainer,
          labelStyle: context.textTheme.labelLarge,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
        ),
        child: InputChip(
          label: Text('Résolution des problèmes'),
          onDeleted: () {},
        ),
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
