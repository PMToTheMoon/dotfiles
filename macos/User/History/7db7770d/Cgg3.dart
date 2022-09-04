import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:neat/neat.dart';

part 'record_cards.freezed.dart';

@freezed
class RecordCardData with _$RecordCardData {
  const RecordCardData._();

  const factory RecordCardData.withStatus({
    /// dossier status between 0 and 1
    required String patientFirstName,
    required String patientLastName,
    required String recordTitle,
    required ImageProvider image,
    required Status status,
    required double progress,
  }) = RecordCardWithStatusData;

  const factory RecordCardData.withEditButton({
    required String patientFirstName,
    required String patientLastName,
    required String recordTitle,
    required ImageProvider image,
  }) = RecordCardWithEditButtonData;
}

class RecordCard extends StatelessWidget {
  const RecordCard({
    super.key,
    required this.data,
  });

  final RecordCardData data;

  @override
  Widget build(BuildContext context) {
    return data.map(
      withStatus: (data) => _RecordCardWithStatus(data: data, key: key),
      withEditButton: (data) => _RecordCardWithEditButton(data: data, key: key),
    );
  }
}

class _RecordCardWithStatus extends StatelessWidget {
  const _RecordCardWithStatus({
    super.key,
    required this.data,
  });

  final RecordCardWithStatusData data;

  @override
  Widget build(BuildContext context) {
    return _RecordCardContainer(
      child: Row(
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
            child: StatusBar(status: data.status, value: data.progress),
          ),
          const SpaceSmaller.w(),
          StatusPercent(data.progress),
          const SpaceSmaller.w(),
          StatusBadge(data.status),
        ],
      ),
    );
  }
}

class _RecordCardWithEditButton extends StatelessWidget {
  const _RecordCardWithEditButton({
    super.key,
    required this.data,
  });

  final RecordCardWithEditButtonData data;

  @override
  Widget build(BuildContext context) {
    return _RecordCardContainer(
      child: Row(
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
            onPressed: () {},
            icon: Icon(Icons.edit),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            iconSize: Dimensions.iconMedium,
          )
        ],
      ),
    );
  }
}

class _RecordCardContainer extends StatelessWidget {
  const _RecordCardContainer({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
      ),
      padding: const PaddingSmall(),
      child: child,
    );
  }
}
