import 'package:common/common.dart';
import 'package:flutter/material.dart';

const _kSize = Dimensions.sizeSmall;

class ZanalysRadio extends StatelessWidget {
  const ZanalysRadio({
    super.key,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      child: Icon(
        Icons.check,
        size: 12,
      ),
    );
  }
}
