import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:translations/translations.dart';

part 'professional_experience.g.dart';

@JsonSerializable()
class ProfessionalExperience {
  const ProfessionalExperience(
      {required this.title,
      required this.company,
      required this.location,
      required this.beginDate,
      this.endDate});

  factory ProfessionalExperience.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalExperienceFromJson(json);

  final String title;

  final String company;

  final String location;

  final DateTime beginDate;

  final DateTime? endDate;

  Map<String, dynamic> toJson() => _$ProfessionalExperienceToJson(this);


  String get displayPeriode(BuildContext context) {
    if (endDate == null) return context.l10n.professional_experience_period_ongoing(beginDate);
    
  }
}
