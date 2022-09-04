import 'package:flutter/material.dart';

class KeyboardSpace extends StatelessWidget {
  const KeyboardSpace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return FocusScope(
      node: _focusScope,
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboardSpace),
        child: widget.child,
      ),
    );
  }
}
