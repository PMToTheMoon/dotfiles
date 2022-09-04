import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum NetworkAffectation {
  @JsonValue('RESEAU')
  network,
  @JsonValue('ZANALYS')
  zanalys,
}
