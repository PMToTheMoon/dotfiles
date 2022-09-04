import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_filter.g.dart';

@JsonEnum()
enum GridFilterCriteria {
  @JsonValue('prenom')
  firstName,
  @JsonValue('nom')
  lastName,
}

typedef GridFilter = MapEntry<GridFilterCriteria, String>;
