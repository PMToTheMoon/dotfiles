import 'package:intl/intl.dart';

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

final _dateFormat = DateFormat('YYYY-MM-dd');

/// Convert a nullable DateTime to a non-nullable DateTime at format YYYY-MM-dd,
/// null being represented by [kNullDate] token
String fakeNullableDateToJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
  return _dateFormat.format(date);
}

/// Convert a non-nullable date at format [_dateFormat] to a nullable DateTime,
/// null date being represented by [kNullDate].
DateTime? fakeNullableDateFromJson(String date) {
  final d = _dateFormat.parse(date);
  if (d == _kNullDate) return null;
  return d;
}

/// Convert a DateTime to a date string at format [_dateFormat],
/// null being represented by [kNullDate] token
String dateToJson(DateTime? date) {
  if (date == null) return _kNullDate.toIso8601String();
  return _dateFormat.format(date);
}

/// Convert a non-nullable date at format [_dateFormat] to a nullable DateTime,
/// null date being represented by [kNullDate].
DateTime? fakeNullableDateFromJson(String date) {
  final d = _dateFormat.parse(date);
  if (d == _kNullDate) return null;
  return d;
}
