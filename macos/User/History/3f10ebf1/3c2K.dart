import 'package:json_annotation/json_annotation.dart';
part 'rapport_general.g.dart';

@JsonSerializable()
class RapportGeneral {
  const RapportGeneral({
    @JsonKey(name: 'identifiant') required this.id,
    @JsonKey(name: 'dateEnvoiPrestataireMedecin') this.sentDate,
    @JsonKey(name: 'synthese') this.synthesis,
    @JsonKey(name: 'commentaire') this.comment,
    @JsonKey(name: 'syntheseTe') this.teleExpertiseSynthesis,
    @JsonKey(name: 'commentaireTe') this.teleExpertiseComment,
    @JsonKey(name: 'dateEnvoiTeleexpertise') this.teleExpertiseSentDate,
    @JsonKey(name: 'interpretationMulti') this.interpretation,
  });

  factory RapportGeneral.fromJson(Map<String, dynamic> json) =>
      _$RapportGeneralFromJson(json);

  @JsonKey(name: 'identifiant')
  final int id;

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

  Map<String, dynamic> toJson() => _$RapportGeneralToJson(this);
}
