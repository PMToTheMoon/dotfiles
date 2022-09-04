import 'package:common/common.dart';
import 'package:translations/translations.dart';
import 'package:flutter/material.dart';

enum IndicatorType {
  generic,
  noRecord,
  noPatient,
  noDoctor;

  String display(BuildContext context) {
    switch (this) {
      case IndicatorType.noRecord:
        return context.l10n.empty_list_indicator_no_record;
      case IndicatorType.noPatient:
        return context.l10n.empty_list_indicator_no_patient;
      case IndicatorType.noDoctor:
        return context.l10n.empty_list_indicator_no_doctor;
      default:
        return context.l10n.empty_list_indicator;
    }
  }

  Image image() {
    switch (this) {
      case IndicatorType.noRecord:
        return Assets.images.illustrations.folder.image();
      case IndicatorType.noPatient:
        return Assets.images.illustrations.mug.image();
      case IndicatorType.noDoctor:
        return Assets.images.illustrations.looking.image();
      default:
        return Assets.images.illustrations.looking.image();
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
      child: Column(
        children: [
          Text(indicator.display(context)),
          indicator.image(),
        ],
      ),
    );
  }
}
