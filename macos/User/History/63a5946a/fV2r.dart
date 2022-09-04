import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'record_data.dart';

part 'record_tile.dart';

class RecordCard extends StatelessWidget {
  const RecordCard(
    this.data, {
    super.key,
    this.onTap,
  });

  final RecordCardData data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return _RecordCardContainer(
      onTap: onTap,
      child: data.map(
        withStatus: (data) => _RecordCardWithStatus(data: data),
        withEditButton: (data) => _RecordCardWithEditButton(data: data),
        patientRecord: (data) => _RecordCardPatientRecord(data: data),
      ),
    );
  }
}

class _RecordCardContainer extends StatelessWidget {
  const _RecordCardContainer({
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surface,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
      ),
      type: MaterialType.card,
      child: InkWell(
        onTap: onTap,
        splashFactory: InkSparkle.splashFactory,
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
        child: Padding(
          padding: const PaddingSmall(),
          child: child,
        ),
      ),
    );
  }
}
