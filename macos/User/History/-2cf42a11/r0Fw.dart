import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_enum.g.dart';

@JsonEnum()
enum EnumTest {
  @JsonValue('renamed')
  field;
}
