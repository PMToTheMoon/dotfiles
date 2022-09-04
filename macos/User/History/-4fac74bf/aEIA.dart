import 'package:flutter/material.dart';

class KeyboardSpace extends StatelessWidget {
  const KeyboardSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible()
    Focus.of(context).context
    final focused = FocusScope.of(context).focusedChild?.context;
    });
    return SizedBox(
      height: bottom,
    );
  }
}
