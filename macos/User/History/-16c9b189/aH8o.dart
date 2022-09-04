import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class CloseRecordRequest {
  const CloseRecordRequest();

  @JsonKey(name: 'referenceDossier')
  String referenceDossier;
  @JsonKey(name: 'avisMedecin')
  String avisMedecin;
  @JsonKey(name: 'uploadedFilesNameToMakeDownloadable')
  List<String> uploadedFilesNameToMakeDownloadable;

  factory CloseRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseRecordRequestFromJson(json);
}
