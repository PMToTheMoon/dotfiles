import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.size = Dimensions.sizeMedium,
  });

  const LoadingIndicator.button({
    super.key,
    this.size = Dimensions.iconMedium,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: 1,
        color: Colors.amber,
      ),
    );
  }
}
