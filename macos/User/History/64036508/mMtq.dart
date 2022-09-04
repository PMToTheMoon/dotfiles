import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_filter.g.dart';

@JsonEnum()
enum GridFilterCriteria {
  @JsonValue('dossierMedecinPrestataire')
  doctorId,

  @JsonValue('prenom')
  firstName,

  @JsonValue('nom')
  lastName,
}

@JsonSerializable()
class GridFilter {
  const GridFilter(
    this.criteria,
    this.value,
  );

  final GridFilterCriteria criteria;
  final String value;

  Map<String, dynamic> toJson() =>
      {_$GridFilterCriteriaEnumMap[criteria]!: value};

  String toString() => '{"${_$GridFilterCriteriaEnumMap[criteria]}": "$value"}';
}
