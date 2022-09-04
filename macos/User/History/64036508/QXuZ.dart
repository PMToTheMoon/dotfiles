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

class GridFilter {
  const GridFilter(
    this.criteria,
    this.value,
  );

  final GridFilterCriteria criteria;
  final String value;

  String toString() => '{"${_$GridFilterCriteriaEnumMap[criteria]}": "$value"}';
}
