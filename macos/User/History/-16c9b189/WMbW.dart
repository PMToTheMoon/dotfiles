import 'package:freezed_annotation/freezed_annotation.dart';

part 'close_record_request.g.dart';

@JsonSerializable()
class CloseRecordRequest {
  CloseRecordRequest({
    required this.recordId,
    required this.text,
    this.uploadedFilesNameToMakeDownloadable = const [],
  });

  @JsonKey(name: 'referenceDossier')
  final String recordId;

  @JsonKey(name: 'avisMedecin')
  final String text;

  @JsonKey(name: 'uploadedFilesNameToMakeDownloadable')
  final List<String> uploadedFilesNameToMakeDownloadable;

  factory CloseRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$CloseRecordRequestFromJson(json);
}
