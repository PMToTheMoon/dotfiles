import 'package:json_annotation/json_annotation.dart';

part 'test_enum.g.dart';

@JsonEnum()
enum EnumTest {
  @JsonValue('renamed')
  field;
}
