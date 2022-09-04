import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

@JsonSerializable()
class FullRecordResponse {
  const FullRecordResponse({
    required this.record,
  });

  @JsonKey(name: 'dossier', toJson: anyToJson)
  final Record record;

  @JsonKey(name: 'dossier', toJson: anyListToJson)
  final List<Record> childRecords;

  factory FullRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$FullRecordResponseFromJson(json);
}
