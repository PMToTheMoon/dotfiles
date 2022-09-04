import 'package:json_annotation/json_annotation.dart';
part 'rapport_multi.g.dart';

@JsonSerializable()
class RapportMulti {
  const RapportMulti(
      {required this.id,
      this.sentDate,
      this.synthesis,
      this.comment,
      this.teleExpertiseSynthesis,
      this.teleExpertiseComment,
      this.teleExpertiseSentDate,
      this.interpretation});

  factory RapportMulti.fromJson(Map<String, dynamic> json) =>
      _$RapportMultiFromJson(json);

  @JsonKey(name: 'identifiant')
  final String id;

  @JsonKey(name: 'dateEnvoiPrestataireMedecin')
  final int? sentDate;

  @JsonKey(name: 'synthese')
  final String? synthesis;

  @JsonKey(name: 'commentaire')
  final String? comment;

  @JsonKey(name: 'syntheseTe')
  final String? teleExpertiseSynthesis;

  @JsonKey(name: 'commentaireTe')
  final String? teleExpertiseComment;

  @JsonKey(name: 'dateEnvoiTeleexpertise')
  final int? teleExpertiseSentDate;

  @JsonKey(name: 'interpretationMulti')
  final String? interpretation;

  Map<String, dynamic> toJson() => _$RapportMultiToJson(this);
}
