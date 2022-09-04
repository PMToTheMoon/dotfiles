import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'general_record_update.dart';

part 'edit_record_request.g.dart';

@freezed
class RecordUpdateRequest with _$UpdateRecordRequest {
  const RecordUpdateRequest._();

  const factory RecordUpdateRequest.general({
    @JsonKey(name: 'jsonData', toJson: anyToJson)
        required GeneralRecordUpdate record,
  }) = GeneralRecordUpdateRequest;

  factory RecordUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateRecordRequestToJson(this);
}
