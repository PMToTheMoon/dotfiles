import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: context.tbtColors.onDisabled,
      ),
    );
  }
}
