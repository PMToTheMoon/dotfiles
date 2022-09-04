import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

part 'new_professional_experience.g.dart';

@JsonSerializable()
class NewProfessionalExperience {
  const NewProfessionalExperience(
      {required this.title,
      required this.company,
      required this.location,
      required this.startDate,
      this.endDate,
      this.description});

  factory NewProfessionalExperience.fromJson(Map<String, dynamic> json) =>
      _$NewProfessionalExperienceFromJson(json);

  @JsonKey(name: 'job')
  final String title;

  @JsonKey(name: 'companyName')
  final String company;

  final String location;

  @JsonKey(name: 'startingDate', fromJson: dateFromJson, toJson: dateToJson)
  final DateTime startDate;

  @JsonKey(fromJson: fakeNullableDateFromJson, toJson: fakeNullableDateToJson)
  final DateTime? endDate;

  @JsonKey(name: 'jobDescription')
  final String? description;

  Map<String, dynamic> toJson() => _$NewProfessionalExperienceToJson(this);
}
