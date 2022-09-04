part of 'trip_details_bloc.dart';

@freezed
class TripDetailsEvent with _$TripDetailsEvent {
  const TripDetailsEvent._();

  const factory TripDetailsEvent.initialized() = TripDetailsInitialized;

  const factory TripDetailsEvent.tripChanged({
    Trip? trip,
  }) = TripChanged;

  const factory TripDetailsEvent.tripCancellationRequested() =
      TripCancellationRequested;

  const factory TripDetailsEvent.tripCancellationAccepted() =
      TripCancellationAccepted;

  const factory TripDetailsEvent.tripCancellationRefused({
    required String error,
  }) = TripCancellationRefused;

  const factory TripDetailsEvent.tripCancellationUnexpectedError() =
      TripCancellationUnexpectedError;
}
