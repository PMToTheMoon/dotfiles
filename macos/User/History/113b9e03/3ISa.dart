import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_data.freezed.dart';

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
    VoidCallback? onTap,
  }) = RecordCardWithStatusData;

  const factory RecordCardData.withEditButton({
    required String patientFirstName,
    required String patientLastName,
    required String recordTitle,
    required ImageProvider image,
    VoidCallback? onTap,
    VoidCallback? onDelete,
  }) = RecordCardWithEditButtonData;

  const factory RecordCardData.patientRecord({
    required String recordTitle,
    required ImageProvider image,
    required Status status,
    required double progress,
    VoidCallback? onTap,
  }) = RecordCardPatientRecordData;
}
