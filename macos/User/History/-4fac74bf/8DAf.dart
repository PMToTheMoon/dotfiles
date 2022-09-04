import 'package:common/common.dart';
import 'package:flutter/material.dart';

class KeyboardSpace extends StatefulWidget {
  const KeyboardSpace({
    super.key,
  });

  @override
  State<KeyboardSpace> createState() => _KeyboardSpaceState();
}

class _KeyboardSpaceState extends State<KeyboardSpace> {
  @override
  void initState() {
    FocusScope.of(context).addListener(() {
      print("focus changed");
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final focused = FocusScope.of(context).focusedChild?.context;
      if (focused != null) {
        Scrollable.ensureVisible(
          focused,
          alignment: .1,
          curve: Feel.curveMedium,
          duration: Feel.durationMedium,
        );
      }
    });
    return SizedBox(
      height: bottom,
    );
  }
}
