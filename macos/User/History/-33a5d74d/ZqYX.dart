// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

// part 'new_record_body.freezed.dart';
part 'new_record_body.g.dart';

@JsonSerializable()
class NewRecordBody {
  const NewRecordBody({
    required this.record,
  });

  @JsonKey(name: 'jsonData')
  final NewRecord record;

  Map<String, dynamic> toJson() => _$NewRecordBodyToJson(this);
}

Map<String, dynamic> _recordToJson(NewRecord r) => r.toJson();
// @freezed
// class NewRecordBody with _$NewRecordBody {
//   const NewRecordBody._();

//   const factory NewRecordBody({
//     required NewRecord record,
//   }) = _NewRecordBody;

//   factory NewRecordBody.fromJson(Map<String, dynamic> json) =>
//       _$NewRecordBodyFromJson(json);
// }
