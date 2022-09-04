import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

List<Widget> chips(BuildContext context) => const [
      IconText(Icons.access_alarm, 'icon text'),
      EmojiText('🚀', 'emoji text'),
      InputChip(
        avatar: Text('🚀'),
        label: Text("emoji chip"),
      ),
    ];
