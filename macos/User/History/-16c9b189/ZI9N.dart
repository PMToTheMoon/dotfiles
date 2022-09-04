@JsonSerializable()
class CloseRecordRequest {
  const CloseRecordRequest();

  factory CloseRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseRecordRequestFromJson(json);
}
