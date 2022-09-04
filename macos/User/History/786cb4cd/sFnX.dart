import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NetworkAffectation {
    /** Mon réseau **/
    RESEAU = 'RESEAU',
    /** Réseau Zanalys **/
    ZANALYS = 'ZANALYS'
}
