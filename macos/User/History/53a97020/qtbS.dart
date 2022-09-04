import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
part 'observation_card_data_part.freezed.dart';

@freezed
class ObservationCardDataPart with _$ObservationCardDataPart {
  const factory ObservationCardDataPart.identity(
      {required ImageProvider avatar,
      required String firstName,
      required String lastName,
      required String subtitle,
      required String specialty}) = ObservationCardIdentityData;

  const factory ObservationCardDataPart.hiddenObservation(
      {required String observation}) = ObservationCardHiddenObservationData;

  const factory ObservationCardDataPart.patientObservation(
      {required String observation}) = ObservationCardPatientObservationData;

  const factory ObservationCardDataPart.medicalHistory(
      {required Set<String> items}) = ObservationCardMedicalHistoryData;
}
