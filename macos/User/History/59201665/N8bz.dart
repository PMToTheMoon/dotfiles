@JsonSerializable()
class GridPatientResponse {
  const GridPatientResponse();

  factory GridPatientResponse.fromJson(Map<String, dynamic> json) =>
      _$GridPatientResponseFromJson(json);
}
