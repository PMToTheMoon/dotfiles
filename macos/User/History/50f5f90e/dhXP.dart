import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: PaddingLarge(),
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      ),
    );
  }
}

class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: Dimensions.iconMedium,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: context.tbtColors.onDisabled,
      ),
    );
  }
}
