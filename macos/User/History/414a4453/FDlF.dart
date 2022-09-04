import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ZanalysRadio extends StatelessWidget {
  const ZanalysRadio({
    super.key,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      height: 12,
      child: Icon(
        size: 12,
      ),
    );
  }
}
