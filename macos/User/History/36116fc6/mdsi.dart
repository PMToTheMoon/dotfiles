import 'package:flutter/material.dart';
import 'package:zanalys/utils/size_utils.dart';

@Deprecated('Screen relative size should be avoided. '
    'Use flutter default way of handling responsiveness instead.')
class RealHeightSizedBox extends StatelessWidget {
  final double height;
  final Widget? child;

  const RealHeightSizedBox({Key? key, required this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.realHeight(context, height),
      child: child,
    );
  }
}
