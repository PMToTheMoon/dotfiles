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
      initial: initial,
      onSelected: (date) => selectedDate = date,
      minuteInterval: minuteInterval,
    ),
  );
  return selectedDate;
}

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({
    this.date,
    Key? key,
  }) : super(key: key);

  final DateTime? date;

  String get _datePickerLabel {
    final date = context.read<ReservationBloc>().state.date;
    if (date != null) {
      return DateFormat.yMMMd(context.l10n.localeName).add_jm().format(date);
    } else {
      return context.l10n.select_address_button_empty_label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button.secondary(
      _datePickerLabel,
      _onDateTapped,
      expands: true,
      rightIcon: const Icon(
        Icons.calendar_today,
        size: Dimensions.icon2,
        color: Colors.black,
      ),
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        backgroundColor: context.colorScheme.surface.msp,
        foregroundColor: datePickerColor.msp,
      ),
    );
  }
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
                () => Navigator.of(context).pop(),
              ),
              const Space4.w(),
              Button.primary(
                context.l10n.validate,
                () => Navigator.of(context).pop(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
