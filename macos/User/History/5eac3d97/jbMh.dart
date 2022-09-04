import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

@JsonSerializable()
class FullRecordResponse {
  const FullRecordResponse();

  @JsonKey(name: 'dossier')
  final Record record;

  final

  factory FullRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$FullRecordResponseFromJson(json);
}
