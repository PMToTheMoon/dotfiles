import 'package:common/common.dart';
import 'package:flutter/material.dart';

class FormAutocroll extends StatefulWidget {
  const FormAutoScroll({
    super.key,
  });

  @override
  State<FormAutoScroll> createState() => _FormAutoScrollState();
}

class _FormAutoScrollState extends State<FormAutoScroll> {
  @override
  void initState() {
    super.initState();
    FocusScope.of(context).addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    super.dispose();
    FocusScope.of(context).removeListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    print("focus changed");
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
