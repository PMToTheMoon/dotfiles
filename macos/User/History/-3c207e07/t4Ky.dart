import 'package:flutter/material.dart';
import 'package:models/models.dart';

typedef TypeSelectedCallback = void Function(RecordType);

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

  final TypeSelectedCallback onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return const Text('SelectRecordPage');
  }
}
