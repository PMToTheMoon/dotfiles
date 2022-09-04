import 'package:flutter/material.dart';
import 'package:common/common.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
  }) : super(key: key);

  const LoadingIndicator.small({
    Key? key,
  })  : size = Dimensions.icon3,
        strokeWidth = 2,
        super(key: key);

  final double? size;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
        ),
      ),
    );
  }
}
