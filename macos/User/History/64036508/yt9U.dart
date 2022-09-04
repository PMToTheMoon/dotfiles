import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_filter.g.dart';

@JsonEnum()
enum GridFilterCriteria {
  @JsonValue('prenom')
  firstName,
  @JsonValue('nom')
  lastName,
}

@JsonSerializable()
class GridFilter {
  const GridFilter({
    required this.criteria,
    required this.value,
  });

  final GridFilterCriteria criteria;
  final String value;

  factory GridFilter.fromJson(Map<String, dynamic> json) =>
      _$GridFilterFromJson(json);
  Map<String, dynamic> toJson() => {criteria};
}
