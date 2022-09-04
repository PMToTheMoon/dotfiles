import 'package:flutter/material.dart';

class IndentedDivider extends Divider {
  const IndentedDivider({
    super.key,
  }) : super(
          indent: Dimensions.sizeLarge,
          height: 1,
        );
}
