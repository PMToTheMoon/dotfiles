import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:translations/translations.dart';

part 'professional_experience.g.dart';

@JsonSerializable()
class ProfessionalExperience {
  const ProfessionalExperience(
      {required this.id,
      required this.title,
      required this.company,
      required this.location,
      required this.startDate,
      this.endDate,
      this.description});

  factory ProfessionalExperience.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalExperienceFromJson(json);

  @JsonKey(name: 'proExperienceId')
  final String id;

  @JsonKey(name: 'job')
  final String title;

  @JsonKey(name: 'companyName')
  final String company;

  final String location;

  @JsonKey(name: 'startingDate')
  final DateTime startDate;

  @JsonKey(fromJson: _fromJson2, toJson: _toJson2)
  final DateTime? endDate;

  @JsonKey(name: 'jobDescription')
  final String? description;

  Map<String, dynamic> toJson() => _$ProfessionalExperienceToJson(this);
  String displayPeriod(BuildContext context) {
    if (endDate == null) {
      return context.l10n.period_ongoing(startDate);
    }
    return context.l10n.period_ended(startDate, endDate!);
  }
}

final _dateFormatter = DateFormat('yyyy-MM-dd');
DateTime _fromJson(String date) => _dateFormatter.parse(date);
String _toJson(DateTime date) => _dateFormatter.format(date);

DateTime? _fromJson2(String date) => _dateFormatter.parse(date);
String _toJson2(DateTime? date) => _dateFormatter.format(date!);
