import 'package:flutter/material.dart';
import 'package:zanalys/utils/size_utils.dart';

@Deprecated(
    'Screen relative size should be avoided. Use flutter default way of handling responsiveness instead.')
class RealWidthSizedBox extends StatelessWidget {
  final double width;
  final Widget? child;

  const RealWidthSizedBox({Key? key, required this.width, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.realWidth(context, width),
      child: child,
    );
  }
}
