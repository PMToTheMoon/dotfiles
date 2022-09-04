import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IndentedDivider extends Divider {
  const IndentedDivider({
    super.key,
  }) : super(
          indent: Dimensions.sizeLarge,
          height: 1,
        );
}
