import 'package:json_annotation/json_annotation.dart';

part 'test_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum EnumTest {
  @JsonValue('renamed')
  field;
}
