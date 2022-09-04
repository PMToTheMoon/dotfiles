import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys_api/src/record_api/models/new_record_multi.dart';

@JsonSerializable()
class EditRecordRequest {
  const EditRecordRequest();

  @JsonKey('jsonData')
  final NewRecordMulti record;

  factory EditRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRecordRequestFromJson(json);
  factory EditRecordRequest.toJson() => _$EditRecordRequestToJson(this);
}
