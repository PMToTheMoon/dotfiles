import 'package:flutter/material.dart';
import 'package:common/common.dart';
import 'package:intl/intl.dart';

extension Utils on DateTime {
  DateTime roundMinute(int minuteInterval) {
    final m = (minute / minuteInterval).ceil() * minuteInterval;
    return DateTime(year, month, day, hour, m);
  }

  String fullDateTimeDisplay(BuildContext context) {
    return DateFormat.yMMMd(context.l10n.localeName).add_jm().format(this);
  }

  String dateDisplay(BuildContext context) {
    return DateFormat.yMMMd(context.l10n.localeName).format(this);
  }

  String dateDisplay(BuildContext context) {
    return DateFormat.yMMMd(context.l10n.localeName).format(this);
  }
}
