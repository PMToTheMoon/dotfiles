import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import '/common.dart';

class PhoneMenuDisplay extends StatelessWidget {
  const PhoneMenuDisplay({
    required this.number,
    this.icon = Icons.phone,
    Key? key,
  }) : super(key: key);

  final String number;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final _countryCode = _extractCountryCode(number);
    late final _number;
    if (_countryCode != null) {
      _number = _removeCountryCode(number) ?? number;
    } else {
      _number = number;
    }

    return Row(
      children: [
        const Space5(),
        Icon(
          icon,
          color: context.colorScheme.onSurface,
        ),
        const Space5(),
        if (_countryCode != null) Text(_countryCode),
        if (_countryCode != null) const Space5(),
        Expanded(
          child: context.buttonText(
            _number,
            style: TextStyle(color: context.colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}

Future<String> _formatPhoneNumber(String number) {
  final nmbr = await PhoneNumberUtil().parse(springFieldUSASimple);

}

String? _extractCountryCode(String phoneNumber) {
  
  if (phoneNumber.startsWith(RegExp(r'[0-9]{4}'))) {
    return phoneNumber.substring(0, 4).replaceFirst(RegExp(r'0*'), '+');
  }
  return null;
}

String? _removeCountryCode(String phoneNumber) {
  if (phoneNumber.length > 4) {
    return RegExp(r'.{2}|.*')
        .allMatches(phoneNumber, 4)
        .map((e) => e.group(0))
        .join(" ");
  }
  return null;
}
