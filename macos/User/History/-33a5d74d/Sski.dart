import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

part 'new_record_body.g.dart';

@JsonSerializable()
class NewRecordBody {
  const NewRecordBody({
    required this.record,
  });

  @JsonKey(name: 'jsonData')
  final NewRecord record;

  factory NewRecordBody.fromJson(Map<String, dynamic> json) =>
      _$NewRecordBodyFromJson(json);
}
