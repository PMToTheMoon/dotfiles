part of 'observations_bloc.dart';

@freezed
class ObservationsEvent with _$ObservationsEvent {
  const ObservationsEvent._();

  const factory ObservationsEvent.addComplementButtonPressed({
    required ComplementType complementType,
  }) = ObservationsAddComplementButtonPressed;

  const factory ObservationsEvent.complementFormSubmitted({
    required RecordComplement complement,
  }) = ObservationsComplementFormSubmitted;

  const factory ObservationsEvent.closeComplementSubmitted({
    required String title,
    required String message,
  }) = ObservationsCloseComplementSubmitted;

  const factory ObservationsEvent.generalRapportFormSubmitted({
    required RapportGeneral rapport,
    required bool completeRecord,
  }) = ObservationsGeneralRapportFormSubmitted;
}
