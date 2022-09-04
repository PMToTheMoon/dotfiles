import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ZanalysBottomSheet extends StatelessWidget {
  const ZanalysBottomSheet({
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PaddingSmall(),
      child: child,
    );
  }
}
