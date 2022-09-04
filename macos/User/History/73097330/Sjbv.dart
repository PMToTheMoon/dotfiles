import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import '/common.dart';

class PhoneMenuDisplay extends StatelessWidget {
  const PhoneMenuDisplay({
    required this.number,
    required this.countryCode,
    this.icon = Icons.phone,
    Key? key,
  }) : super(key: key);

  final String number;
  final String countryCode;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // final _countryCode = _extractCountryCode(number);
    // late final _number;
    // if (_countryCode != null) {
    //   _number = _removeCountryCode(number) ?? number;
    // } else {
    //   _number = number;
    // }

    return Row(
      children: [
        const Space5(),
        Icon(
          icon,
          color: context.colorScheme.onSurface,
        ),
        const Space5(),
        Text(countryCode),
        const Space5(),
        Expanded(
          child: context.buttonText(
            number,
            style: TextStyle(color: context.colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
