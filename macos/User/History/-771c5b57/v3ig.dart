import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as ext;

class RecordCardShimmer extends StatelessWidget {
  const RecordCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SharedShimmer(
      enabled: false,
      child: Container(
        padding: const PaddingSmall.all(),
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SharedShimmer(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(Dimensions.sizeMedium)),
                height: Dimensions.sizeSmall,
                width: Dimensions.sizeSmall,
              ),
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
