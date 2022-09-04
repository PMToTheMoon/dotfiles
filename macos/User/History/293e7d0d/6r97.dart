import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys_api/src/record_api/models/new_record_multi.dart';

part 'edit_record_request.g.dart';

@JsonSerializable()
class EditRecordRequest {
  const EditRecordRequest(
    this.record,
  );

  @JsonKey(name: 'jsonData')
  final NewRecordMulti record;

  factory EditRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditRecordRequestToJson(this);
}
