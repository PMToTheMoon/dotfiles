import 'package:translations/translations.dart';
import 'package:flutter/material.dart';

enum IndicatorType {
  generic,
  noRecord,
  noPatient,
  noDoctor;

  String display(BuildContext context) {
    switch (this) {
      case empty_list_indicator_no_folder:
        return context.l10n.empty_list_indicator_no_folder;
      case empty_list_indicator_no_patient:
        return context.l10n.empty_list_indicator_no_patient;
      case empty_list_indicator_no_doctor:
        return context.l10n.empty_list_indicator_no_doctor;
      default:
        return context.l10n.empty_list_indicator;
    }
  }
}

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    this.indicator = IndicatorType.generic,
    super.key,
  });

  final IndicatorType indicator;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.empty_list_indicator),
    );
  }
}
