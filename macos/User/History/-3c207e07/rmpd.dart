import 'package:flutter/material.dart';
import 'package:models/models.dart';

typedef TypeSelectedCallback = void Function(RecordType);

class SelectRecordTypePage extends StatelessWidget {
  static SelectRecordTypePage builder(
    BuildContext context, {
    TypeSelectedCallback? onTypeSelected,
  }) =>
      SelectRecordTypePage(
        onTypeSelected: onTypeSelected,
      );

  static MaterialPageRoute materialPageRoute() => MaterialPageRoute(
      builder: (context) => builder(
            context,
            onTypeSelected: onTypeSelected,
          ));

  static Future open(BuildContext context) =>
      Navigator.of(context).push(materialPageRoute());

  const SelectRecordTypePage({
    super.key,
    this.onTypeSelected,
  });

  final TypeSelectedCallback? onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return const Text('SelectRecordPage');
  }
}
