import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

typedef TypeSelectedCallback = void Function(RecordType);

class SelectRecordTypePage extends StatelessWidget {
  static SelectRecordTypePage builder(
    BuildContext context, {
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      SelectRecordTypePage(
        patient: patient,
        onTypeSelected: onTypeSelected,
      );

  static MaterialPageRoute materialPageRoute({
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      MaterialPageRoute(
        builder: (context) => builder(
          context,
          patient: patient,
          onTypeSelected: onTypeSelected,
        ),
      );

  static Future open(
    BuildContext context, {
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      Navigator.of(context).push(materialPageRoute(
        patient: patient,
        onTypeSelected: onTypeSelected,
      ));

  const SelectRecordTypePage({
    super.key,
    required this.patient,
    this.onTypeSelected,
  });

  final Patient patient;
  final TypeSelectedCallback? onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: title,
        subtitle: subtitle,
        image: image,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("a")],
        ),
      ),
    );
  }
}
