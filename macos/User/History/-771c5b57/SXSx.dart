import 'package:common/common.dart';
import 'package:flutter/material.dart';

class IdentityShimmer extends StatelessWidget {
  const IdentityShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Dimensions.sizeMedium)),
              height: Dimensions.sizeSmall,
              width: Dimensions.sizeSmall,
            ),
            const SpaceSmall.w(),
            Container(
              color: Colors.black,
              height: 16,
              width: Dimensions.sizeLargest,
            ),
          ],
        ),
      ),
    );
  }
}
