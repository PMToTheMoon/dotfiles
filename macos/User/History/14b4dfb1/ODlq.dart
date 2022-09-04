import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IdentityShimmer extends StatelessWidget {
  const IdentityShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          height: Dimensions.sizeMedium,
          width: Dimensions.sizeMedium,
        ),
        const SpaceSmall.w(),
        Container(
          color: Colors.black,
          height: 16,
          width: Dimensions.sizeLargest,
        ),
      ],
    );
  }
}
