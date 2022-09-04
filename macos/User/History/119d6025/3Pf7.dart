import 'package:common/common.dart';
import 'package:flutter/material.dart';

class GuideEditingController extends TextEditingController {
  GuideEditingController({
    required this.shadowText,
    super.text,
  });

  final String shadowText;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    TextSpan? spane;
    if (text.length < shadowText.length) {
      guide = TextSpan(
        text: shadowText.substring(text.length),
        style: style?.copyWith(
          color: context.tbtColors.onDisabled,
        ),
      );
    }

    // assert(!value.composing.isValid ||
    //     !withComposing ||
    //     value.isComposingRangeValid);
    // If the composing range is out of range for the current text, ignore it to
    // preserve the tree integrity, otherwise in release mode a RangeError will
    // be thrown and this EditableText will be built with a broken subtree.
    if (!value.isComposingRangeValid || !withComposing) {
      return TextSpan(style: style, children: [
        TextSpan(text: text),
        if (guide != null) guide,
      ]);
    }
    final TextStyle composingStyle =
        style?.merge(const TextStyle(decoration: TextDecoration.underline)) ??
            const TextStyle(decoration: TextDecoration.underline);
    return TextSpan(
      style: style,
      children: <TextSpan>[
        TextSpan(text: value.composing.textBefore(value.text)),
        TextSpan(
          style: composingStyle,
          text: value.composing.textInside(value.text),
        ),
        TextSpan(text: value.composing.textAfter(value.text)),
        if (guide != null) guide,
      ],
    );
  }
}
