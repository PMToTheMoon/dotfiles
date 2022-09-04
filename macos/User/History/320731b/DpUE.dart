final _kNullDate = DateTime(9999, 1, 1);

/// Convert a nullable DateTime to a non-nullable date null date constant [kNullDate]
String fakeNullableDateTimeToJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
  return date.toIso8601String();
}

String fakeNullableDateTimeFromJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
  return date.toIso8601String();
}
