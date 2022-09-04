import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class RecordCardShimmer extends StatelessWidget {
  const RecordCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer(
          child: Container(
            padding: const PaddingSmall.all(),
            color: context.colorScheme.outline,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.medium(
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
      ],
    );
  }
}
