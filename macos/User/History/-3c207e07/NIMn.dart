import 'package:flutter/material.dart';

class SelectRecordTypePage extends StatelessWidget {
  static SelectRecordTypePage builder(BuildContext context) =>
      const SelectRecordTypePage();

  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: builder);

  static Future open(BuildContext context) =>
      Navigator.of(context).push(materialPageRoute());

  const SelectRecordTypePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('SelectRecordPage');
  }
}
