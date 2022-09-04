import 'dart:ffi';

import 'package:common/src/widgets/prefixed_text/prefixed_text.dart';
import 'package:flutter/material.dart';

class EmojiText extends StatelessWidget {
  const EmojiText(
    this.emoji,
    this.text, {
    super.key,
  });

  final String emoji;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PrefixedText(
      prefix: Text(emoji),
      text: text,
    );
  }
}
