enum GridFilterCriteria {
  firstName,
  lastName,
}

typedef GridFilter = Map<GridFilter, String>;

@JsonSerializable()
class GridFilter {
  const GridFilter();

  final

  factory GridFilter.fromJson(Map<String, dynamic> json) => _$GridFilterFromJson(json);
  Map<String, dynamic> toJson() => _$GridFilterToJson(this);
}
