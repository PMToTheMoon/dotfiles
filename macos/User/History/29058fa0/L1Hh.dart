import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
)
typedef Models = Map<String, dynamic>;
