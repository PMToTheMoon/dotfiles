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
  final _focusScope = FocusScopeNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusManager.instance.addListener(_onFocusChanged);
    // FocusScope.of(context).addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.removeListener(_onFocusChanged);
    // FocusScope.of(context).removeListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    print("focus changed");
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
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
    return FocusScope(
      node: _focusScope,
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboardSpace),
        child: SingleChildScrollView(
          child: widget.child,
        ),
      ),
    );
  }
}
