import 'package:flutter/cupertino.dart';
import 'package:neat/neat.dart';
import '/common.dart';

Future<DateTime?> showDatePicker(
  BuildContext context, {
  DateTime? initial,
  int minuteInterval = 1,
}) async {
  DateTime? selectedDate;
  await showCupertinoModalPopup(
    context: context,
    builder: (_) => DatePicker(
      initial: selected,
      onSelected: (val) => selected = val,
      minuteInterval: kReservationMinuteIntervale,
    ),
  );
}

class DatePicker extends StatelessWidget {
  const DatePicker._({
    DateTime? initial,
    required DateTime minimum,
    required this.onSelected,
    this.minuteInterval = 1,
    Key? key,
  })  : _initial = initial,
        _minimum = minimum,
        super(key: key);

  factory DatePicker({
    DateTime? initial,
    required ValueChanged<DateTime> onSelected,
    int minuteInterval = 1,
    Key? key,
  }) {
    assert(minuteInterval > 0);

    final now = DateTime.now();
    final i = initial ?? now;
    final m = (i.minute / minuteInterval).ceil() * minuteInterval;
    final rounded = DateTime(i.year, i.month, i.day, i.hour, m);
    final minimum = rounded.isBefore(now) ? rounded : now;
    if (rounded != initial) {
      onSelected(rounded);
    }
    return DatePicker._(
      initial: rounded,
      minimum: minimum,
      onSelected: onSelected,
    );
  }

  final DateTime _minimum;
  final DateTime? _initial;
  final ValueChanged<DateTime> onSelected;
  final int minuteInterval;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.longestSide * 0.6,
      padding: const Padding3.all(),
      color: context.colorScheme.surface,
      child: Column(
        children: [
          Expanded(
            child: CupertinoDatePicker(
              minuteInterval: minuteInterval,
              use24hFormat: true,
              minimumDate: _minimum,
              initialDateTime: _initial,
              onDateTimeChanged: onSelected,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button.secondary(
                context.l10n.cancel,
                () => Navigator.of(context).pop(false),
              ),
              const Space4.w(),
              Button.primary(
                context.l10n.validate,
                () => Navigator.of(context).pop(true),
              ),
            ],
          )
        ],
      ),
    );
  }
}
