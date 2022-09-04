import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IdentityShimmer extends StatelessWidget {
  const IdentityShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.black,
          height: Dimensions.sizeMedium,
          width: Dimensions.sizeMedium,
        ),
        const SpaceSmall.w(),
        Container(
          color: Colors.black,
          height: Dimensions.sizeSmaller,
          width: Dimensions.sizeLargest,
        ),
      ],
    );
  }
}
