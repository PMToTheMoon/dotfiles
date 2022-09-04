@JsonSerializable()
class EditRecordRequest {
  const EditRecordRequest();

  factory EditRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$EditRecordRequestFromJson(json);
  factory EditRecordRequest.toJson() => _$EditRecordRequestToJson(this);
}
