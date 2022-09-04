import 'package:common/src/theme/dimensions.dart';
import 'package:flutter/material.dart';

class AvatarShimmer extends StatelessWidget {
  const AvatarShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Dimensions.sizeMedium)),
      height: Dimensions.sizeMedium,
      width: Dimensions.sizeMedium,
    );
  }
}
