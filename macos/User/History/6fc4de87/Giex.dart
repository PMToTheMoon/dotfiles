part of 'observations_bloc.dart';

@freezed
class ObservationsState with _$ObservationsState {
  const ObservationsState._();

  const factory ObservationsState.idle() = ObservationsIdle;
  const factory ObservationsState.displayComplementForm() =
      ObservationsDisplayComplemetForm;
  const factory ObservationsState.displayRapportForm() =
      ObservationsDisplayRapportForm;
}
