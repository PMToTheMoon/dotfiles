final _kNullDate = DateTime(9999, 1, 1);

String nullableDateTimeToJson(DateTime? date) {
  if (date == null) return _kNullDate.toString();
}
