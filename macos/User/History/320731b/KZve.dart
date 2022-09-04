final _kNullDate = DateTime(9999, 1, 1);

String fakeNullableDateTimeToJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
}
