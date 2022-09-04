import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:translations/translations.dart';

part 'professional_experience.freezed.dart';

@freezed
class ProfessionalExperience with _$ProfessionalExperience {
  const ProfessionalExperience._();

  const factory ProfessionalExperience(
      {required String id,
      required String title,
      required String company,
      required String location,
      required DateTime startDate,
      DateTime? endDate,
      String? description}) = _ProfessionalExperience;

  String displayPeriod(BuildContext context) {
    if (endDate == null) {
      return context.l10n.period_ongoing(startDate);
    }
    return context.l10n.period_ended(startDate, endDate!);
  }
}
