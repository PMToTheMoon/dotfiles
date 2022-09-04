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
          color: Colors.white,
          height: Dimensions.sizeMedium,
          width: Dimensions.sizeMedium,
        ),
        Container(
          color: Colors.white,
          height: Dimensions.sizeSmall,
          width: double.infinity,
        ),
      ],
    );
  }
}
