part of 'trip_details_bloc.dart';

@freezed
class TripDetailsState with _$TripDetailsState {
  const TripDetailsState._();

  const factory TripDetailsState.initial({
    required Trip trip,
  }) = TripDetailsInitial;

  const factory TripDetailsState.cancellationInProgress({
    required Trip trip,
  }) = TripCancellationInProgress;

  const factory TripDetailsState.cancellationSuccess({
    required Trip trip,
  }) = TripCancellationSuccess;

  const factory TripDetailsState.cancellationError({
    required Trip trip,
    required String error,
  }) = TripCancellationError;

  const factory TripDetailsState.unexpectedError({
    required Trip trip,
  }) = TripDetailsUnexpectedError;

  const factory TripDetailsState.exit({
    required Trip trip,
  }) = TripDetailsExit;
}
