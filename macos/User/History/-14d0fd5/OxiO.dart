import 'package:json_annotation/json_annotation.dart';

/// Not used by front but sent with NewRecord, to be investigated
enum InPersonConsultationMode {
  @JsonValue('RAPPELE')
  recalls,

  @JsonValue('SECRETARIAT_TELEPHONE')
  secretariatPhone,

  @JsonValue('SECRETARIAT_TELEPHONE' 'SITE_WEB')
  webSite
}
