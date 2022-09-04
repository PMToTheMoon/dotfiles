import 'package:common/common.dart';
import 'package:flutter/material.dart';

class FormAutoScroll extends StatefulWidget {
  const FormAutoScroll({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<FormAutoScroll> createState() => _FormAutoScrollState();
}

class _FormAutoScrollState extends State<FormAutoScroll> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusManager.instance.addListener(_scrollToCurrentlyFocused);
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.removeListener(_scrollToCurrentlyFocused);
  }

  void _scrollToCurrentlyFocused() {
    if (mounted) {
      final focused = FocusScope.of(context).focusedChild?.context;
      if (focused != null) {
        Scrollable.ensureVisible(
          focused,
          alignment: .125,
          curve: Feel.curveMedium,
          duration: Feel.durationMedium,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
