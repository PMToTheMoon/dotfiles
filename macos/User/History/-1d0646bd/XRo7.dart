import 'package:translations/translations.dart';
import 'package:flutter/material.dart';

enum IndicatorType {
  noRecord,
  noPatient,
  noDoctor,
}

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
