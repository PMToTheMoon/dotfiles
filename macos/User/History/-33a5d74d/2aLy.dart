import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';

@JsonSerializable()
class NewRecordBody {
  const NewRecordBody({
    required this.record,
  });

  final NewRecord record;

  factory NewRecordBody.fromJson(Map<String, dynamic> json) =>
      _$NewRecordBodyFromJson(json);
}
