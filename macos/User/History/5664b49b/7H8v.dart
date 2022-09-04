import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue('M')
  male,
  @JsonValue('MME')
  female,
}
