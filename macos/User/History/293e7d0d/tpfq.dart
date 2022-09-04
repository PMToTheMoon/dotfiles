import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'general_record_update.dart';

part 'edit_record_request.g.dart';

@freezed
class UpdateRecordRequest with _$UpdateRecordRequest {
  const UpdateRecordRequest._();

  const factory UpdateRecordRequest.general({
    @JsonKey(name: 'jsonData', toJson: anyToJson)
        required GeneralRecordUpdate record,
  }) = GeneralRecordUpdateRequest;

  factory UpdateRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateRecordRequestToJson(this);
}
