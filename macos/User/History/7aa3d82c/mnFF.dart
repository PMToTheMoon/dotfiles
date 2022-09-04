import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

List<Widget> chips(BuildContext context) => const [
      IconText(Icons.access_alarm, 'icon text'),
      ColoredIconText.darkBlue(Icons.access_alarm, 'darkBlue icon text'),
      ColoredIconText.mediumBlue(Icons.access_alarm, 'mediumBlue icon text'),
      ColoredIconText.lightBlue(Icons.access_alarm, 'lightBlue icon text'),
      ColoredIconText.darkPurple(Icons.access_alarm, 'darkPurple icon text'),
      ColoredIconText.mediumPurple(
          Icons.access_alarm, 'mediumPurple icon text'),
      EmojiText('💻', 'emoji text'),
    ];
