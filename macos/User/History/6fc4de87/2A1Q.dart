part of 'observations_bloc.dart';

@freezed
class ObservationsState with _$ObservationsState {
  const ObservationsState._();

  const factory ObservationsState.idle() = ObservationsIdle;
  const factory ObservationsState.displayComplementForm({
    required ComplementType complementType,
  }) = ObservationsDisplayComplementForm;
  const factory ObservationsState.displayRapportForm() =
      ObservationsDisplayRapportForm;
  const factory ObservationsState.postForm() = ObservationsPostForm;
  const factory ObservationsState.error() = ObservationsError;
}
