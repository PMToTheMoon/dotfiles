import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neat/neat.dart';

part 'record_cards.freezed.dart';

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

class _RecordCardWithStatus extends StatelessWidget {
  const _RecordCardWithStatus({
    required this.data,
  });

  final RecordCardWithStatusData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Identity(
            avatar: data.image,
            firstName: data.patientFirstName,
            lastName: data.patientLastName,
            subtitle: data.recordTitle,
          ),
        ),
        const SpaceSmaller.w(),
        Expanded(
          flex: 1,
          child: StatusBar(
            value: data.progress,
          ),
        ),
        const SpaceSmaller.w(),
        StatusPercent(data.progress),
        const SpaceSmaller.w(),
        StatusBadge(data.status),
      ],
    );
  }
}

class _RecordCardWithEditButton extends StatelessWidget {
  const _RecordCardWithEditButton({
    required this.data,
  });

  final RecordCardWithEditButtonData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Identity(
            avatar: data.image,
            firstName: data.patientFirstName,
            lastName: data.patientLastName,
            subtitle: data.recordTitle,
          ),
        ),
        IconButton(
          splashRadius: 25,
          onPressed: data.onDelete,
          icon: const Icon(Icons.delete),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          iconSize: Dimensions.iconMedium,
        )
      ],
    );
  }
}

class _RecordCardPatientRecord extends StatelessWidget {
  const _RecordCardPatientRecord({
    required this.data,
  });

  final RecordCardPatientRecordData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Identity(
            avatar: data.image,
            firstName: data.recordTitle,
            subtitle: data.recordTitle,
          ),
        ),
        const SpaceSmaller.w(),
        StatusPercent(data.progress),
        const SpaceSmaller.w(),
        StatusBadge(data.status),
      ],
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
