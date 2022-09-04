import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/general_record_update.dart';
import 'package:zanalys_api/src/record_api/models/new_record_multi.dart';

part 'edit_record_request.g.dart';

@JsonSerializable()
class EditRecordRequest {
  const EditRecordRequest(
    this.record,
  );

  @JsonKey(name: 'jsonData', toJson: anyToJson)
  final GeneralRecordUpdate record;

  factory EditRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditRecordRequestToJson(this);
}
