import 'dart:ffi';

import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Button {
  static ElevatedButton primary(
    String label,
    VoidCallback? onPressed, {
    bool expands = false,
    ButtonStyle? style,
  }) =>
      ElevatedButton(
        onPressed: onPressed,
        style: style,
        child:
            expands ? _primaryExpandedContent(label) : _primaryContent(label),
      );

  static OutlinedButton secondary(
    String label,
    VoidCallback? onPressed, {
    Widget? rightIcon,
    Widget? leftIcon,
    bool expands = false,
    ButtonStyle? style,
  }) =>
      OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: expands
            ? _secondaryExpandedContent(
                label,
                rightIcon: rightIcon,
                leftIcon: leftIcon,
              )
            : _secondaryContent(
                label,
                rightIcon: rightIcon,
                leftIcon: leftIcon,
              ),
      );

  static TextButton text(
    String label,
    VoidCallback? onPressed, {
    Color? color,
    bool expand = false,
  }) {
    final content = Text(
      label,
      style: TextStyle(color: color),
    );
    return TextButton(
      onPressed: onPressed,
      child: expand ? Center(child: content) : content,
    );
  }

  static TextButton menu(
    String label,
    VoidCallback? onPressed, {
    Color? color,
    Color? iconColor,
    bool arrow = true,
    IconData? icon,
  }) =>
      TextButton(
        onPressed: onPressed,
        style: ButtonStyle(padding: EdgeInsets.zero.msp),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const Padding5(right),
                child: Icon(
                  icon,
                  color: iconColor ?? color,
                ),
              ),
            Expanded(
                child: Text(
              label,
              style: TextStyle(color: color),
            )),
            if (arrow)
              Icon(
                Icons.arrow_right,
                color: iconColor ?? color,
              ),
          ],
        ),
      );
}

Widget _primaryContent(String label) => Text(label);

Widget _primaryExpandedContent(String label) => Center(child: Text(label));

Widget _secondaryContent(
  String label, {
  Widget? rightIcon,
  Widget? leftIcon,
}) =>
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leftIcon != null)
          Padding(
            padding: const Padding4(right),
            child: leftIcon,
          ),
        Flexible(child: Text(label)),
        if (rightIcon != null)
          Padding(
            padding: const Padding4(left),
            child: rightIcon,
          ),
      ],
    );

Widget _secondaryExpandedContent(
  String label, {
  Widget? rightIcon,
  Widget? leftIcon,
}) =>
    IntrinsicHeight(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (leftIcon != null) Positioned(left: 0, child: leftIcon),
          Text(
            label,
            textAlign: TextAlign.center,
          ),
          if (rightIcon != null) Positioned(right: 0, child: rightIcon),
        ],
      ),
    );
    // Row(
    //   children: [
    //     if (leftIcon != null)
    //       Padding(padding: const Padding5(right), child: leftIcon),
    //     Expanded(
    //       child: Text(
    //         label,
    //         textAlign: textAlign ?? TextAlign.center,
    //       ),
    //     ),
    //     if (rightIcon != null)
    //       Padding(padding: const Padding5(left), child: rightIcon),
    //   ],
    // );
