Map<String, dynamic>? anyToJson(dynamic object) => object?.toJson();

List<dynamic>? anyListToJson(List<dynamic>? objects) =>
    objects?.map((e) => e.toJson()).toList();

DateTime dateTimeFromJson(int epoch) =>
    DateTime.fromMillisecondsSinceEpoch(epoch);

DateTime? nullableDateTimeFromJson(int? epoch) =>
    epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;
