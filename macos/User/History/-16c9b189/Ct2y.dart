import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class CloseRecordRequest {
  const CloseRecordRequest();

  @JsonKey(name: 'referenceDossier')
  final String referenceDossier;

  @JsonKey(name: 'avisMedecin')
  final String avisMedecin;

  @JsonKey(name: 'uploadedFilesNameToMakeDownloadable')
  final List<String> uploadedFilesNameToMakeDownloadable;

  factory CloseRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseRecordRequestFromJson(json);
}
