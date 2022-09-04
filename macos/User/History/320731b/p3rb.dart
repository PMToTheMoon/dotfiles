final _kNullDate = DateTime(9999, 1, 1);

/// Convert a nullable DateTime to a non-nullable date equal to [kNullDate]
String fakeNullableDateTimeToJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
  return date.toIso8601String();
}

/// Convert a non-nullable date to a DateTime or null if date is equal to [kNullDate]
DateTime? fakeNullableDateTimeFromJson(String date) {
  final d = DateTime.parse(date);
  if (d == _kNullDate) return null;
  return d;
}
