import 'package:common/common.dart';
import 'package:common/src/theme/_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension MakeShimmer on BuildContext {
  Shimmer shimmer(
    Widget child, {
    Key? key,
    bool enabled = true,
  }) =>
      Shimmer.fromColors(
        key: key,
        baseColor: AppColors.lightGray,
        highlightColor: AppColors.white,
        period: Feel.durationLong,
        enabled: enabled,
        child: child,
      );

  Shimmer textShimmer(
    Widget child, {
    Key? key,
    bool enabled = true,
  }) =>
      shimmer(
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: child,
        ),
        key: key,
        enabled: enabled,
      );
}

// final test = _TextPainter(Text("a").textSpan ?? TextSpan());

// class _TextPainter extends CustomPainter {
//   _TextPainter(TextSpan text) : _textPainter = TextPainter(text: text) {
//     _textPainter.layout();
//   }

//   final TextPainter _textPainter;

//   @override
//   void paint(Canvas canvas, Size size) {
//     _textPainter.strutStyle?.fontSize;
//     final width =
//         _textPainter.width < size.width ? _textPainter.width : size.width;
//     final height = _textPainter.strutStyle?.fontSize ?? size.height;
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, width, height < size.height ? height : size.height),
//       Paint()
//         ..style = PaintingStyle.fill
//         ..color = Colors.black,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }
