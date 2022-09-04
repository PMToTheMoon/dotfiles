import 'package:json_annotation/json_annotation.dart';

enum EnumPresentielRdvMode {
    @JsonValue('RAPPELE')
    recalls,

    @JsonValue('SECRETARIAT_TELEPHONE')
    secretariatPhone,
    
    @JsonValue('SECRETARIAT_TELEPHONE''SITE_WEB'),
    webSite
}
