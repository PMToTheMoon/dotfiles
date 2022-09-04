import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'record_data.dart';
import 'record_cards.dart';

class RecordTile extends StatelessWidget {
  const RecordTile(this.data, {super.key, this.onTap});

  final RecordCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const PaddingSmall(),
          child: data.map(
            withStatus: (data) => _RecordCardWithStatus(data: data),
            withEditButton: (data) => _RecordCardWithEditButton(data: data),
            patientRecord: (data) => _RecordCardPatientRecord(data: data),
          ),
        ),
      ),
    );
  }
}
