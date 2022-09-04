import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
)
class Models {
  final Map<String, dynamic>? fields;

  Models({
    this.fields,
  });

  factory Models.fromJson(Map json) => _$ModelsFromJson(json);

  Map<String, dynamic> toJson() => _$ModelsToJson(this);
}
