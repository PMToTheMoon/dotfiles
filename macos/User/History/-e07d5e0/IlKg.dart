import 'package:intl/intl.dart';

extension CommonDateFormats on DateTime {
  String yMMd() => DateFormat.yMMMd().format(this);
}
