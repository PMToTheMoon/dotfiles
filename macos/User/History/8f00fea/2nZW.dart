import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
  }) : super(key: key);

  const LoadingIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
  }) : super(key: key);

  final double? size;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
