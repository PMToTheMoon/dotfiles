import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip({
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSmaller,
        vertical: 2,
      ),
      child: IconTextChip(),
    );
  }
}
