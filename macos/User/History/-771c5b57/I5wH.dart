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
        Positioned.fill(
          child: Shimmer.medium(
            child: Container(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const PaddingSmall.all(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(Dimensions.sizeMedium)),
                  height: Dimensions.sizeSmall,
                  width: Dimensions.sizeSmall,
                ),
              ),
              const SpaceSmall.w(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Shimmer(
                    child: Container(
                      color: Colors.black,
                      height: 16,
                      width: Dimensions.sizeLargest,
                    ),
                  ),
                  const SpaceSmaller.h(),
                  Shimmer.medium(
                    child: Container(
                      color: Colors.black,
                      height: 8,
                      width: Dimensions.sizeLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
