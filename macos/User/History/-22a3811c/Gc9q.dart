import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
part 'observation_card_data_part.freezed.dart';

@freezed
class ObservationCardDataPart with _$ObservationCardDataPart {
  const factory ObservationCardDataPart.hiddenObservation(
      {required String observation}) = ObservationCardHiddenObservationData;

  const factory ObservationCardDataPart.patientObservation(
      {required String observation}) = ObservationCardPatientObservationData;

  const factory ObservationCardDataPart.medicalHistory(
      {required Set<String> items}) = ObservationCardMedicalHistoryData;

  const factory ObservationCardDataPart.symptoms({required Set<String> items}) =
      ObservationCardSymptomsData;

  const factory ObservationCardDataPart.treatments(
      {required Set<String> items}) = ObservationCardTreatmentsData;

  const factory ObservationCardDataPart.additionalObservation(
      {required String observation}) = ObservationCardAdditionalObservationData;

  const factory ObservationCardDataPart.rapport({required String observation}) =
      ObservationCardRapportData;

  const factory ObservationCardDataPart.appointment(
      {required ServiceType type}) = ObservationCardAppointmentData;
}
