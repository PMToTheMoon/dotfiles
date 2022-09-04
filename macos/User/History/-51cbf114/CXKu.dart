import 'package:common/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.empty_list_indicator),
    );
  }
}
