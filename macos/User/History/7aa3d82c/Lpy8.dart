import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

List<Widget> chips(BuildContext context) => const [
      IconText(Icons.access_alarm, 'icon text'),
      EmojiText('🚀', 'emoji text'),
      InputChip(
        avatar: Text(
          '🚀',
          style: TextStyle(fontSize: 14),
        ),
        label: Text("emoji chip"),
      ),
      InputChip(
        avatar: Text(
          '🚀',
          style: TextStyle(fontSize: 14),
        ),
        label: Text("emoji chip"),
      ),
    ];
