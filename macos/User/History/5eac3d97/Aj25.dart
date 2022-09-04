import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

part 'full_record_response.g.dart';

@JsonSerializable()
class FullRecordResponse {
  const FullRecordResponse({
    required this.record,
    required this.childRecords,
  });

  @JsonKey(name: 'dossier', toJson: anyToJson)
  final Record record;

  @JsonKey(name: 'dossiersEnfants', toJson: anyListToJson)
  final List<Record> childRecords;

  factory FullRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$FullRecordResponseFromJson(json);
}
