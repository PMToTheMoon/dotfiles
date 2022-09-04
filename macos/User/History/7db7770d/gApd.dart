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
    required double status,
    required String firstName,
    required String lastName,
    required String subtitle,
    required ImageProvider image,
  }) = RecordCardWithStatusData;

  const factory RecordCardData.withEditButton({
    required String firstName,
    required String lastName,
    required String subtitle,
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
      withStatus: (data) => _RecordCardWithStatus(data: data),
      withEditButton: (data) => _RecordCardWithEditButton(data: data),
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
      child: const Text('_RecordCardWithStatus'),
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
      child: Identity(
        avatar: data.image,
        firstName: data.firstName,
        lastName: data.lastName,
        subtitle: data.subtitle,
      ),
    );
  }
}

class _RecordCardContainer extends StatelessWidget {
  const _RecordCardContainer({
    super.key,
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
