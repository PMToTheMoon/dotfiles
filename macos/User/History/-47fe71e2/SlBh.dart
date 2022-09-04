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

  const factory ObservationsEvent.generalRapportFormSubmitted({
    required RecordStatus recordStatus,
    required RapportGeneral rapport,
    required bool noConsultation,
  }) = ObservationsGeneralRapportFormSubmitted;
}
