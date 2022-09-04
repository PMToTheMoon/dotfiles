import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/utils/utils.dart';
import 'package:models/models.dart';
part 'new_rapport.freezed.dart';
part 'new_rapport.g.dart';

@freezed
class NewRapport with _$NewRapport {
  const factory NewRapport.NewGeneralRapport(
          {@JsonKey(toJson: anyToJson)
              required RapportGeneral rapport,
          @JsonKey(name: 'completedRapport')
              required bool completed,
          @JsonKey(name: 'typeDossier')
              required RecordType recordType,
          @JsonKey(name: 'referenceDossier')
              required String recordId,
          @JsonKey(name: 'typePrestation')
              required ServiceType serviceType,
          @JsonKey(name: 'presentielRdvMode')
              InPersonConsultationMode? inPersonConsultationMode}) =
      NewGeneralRapport;

  factory NewRapport.fromJson(Map<String, dynamic> json) =>
      _$NewRapportFromJson(json);
}
