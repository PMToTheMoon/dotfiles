part of 'address_selection_bloc.dart';

@freezed
class AddressSelectionEvent with _$AddressSelectionEvent {
  const AddressSelectionEvent._();

  const factory AddressSelectionEvent.favoriteAddressesReceived(
    List<FavoriteAddress> favoriteAddresses,
  ) = AddressSelectionFavoriteAddressesReceived;

  // FILTER
  const factory AddressSelectionEvent.filterChanged(
    AddressType filer,
  ) = AddressSelectionFilterChanged;

  // DEPARTURE
  const factory AddressSelectionEvent.departureFocused() =
      AddressSelectionDepartureFocused;

  const factory AddressSelectionEvent.departureChanged(
    String value,
  ) = AddressSelectionDepartureChanged;

  const factory AddressSelectionEvent.departureCleared() =
      AddressSelectionDepartureCleared;

  // ARRIVAL
  const factory AddressSelectionEvent.arrivalFocused() =
      AddressSelectionArrivalFocused;

  const factory AddressSelectionEvent.arrivalChanged(
    String value,
  ) = AddressSelectionArrivalChanged;

  const factory AddressSelectionEvent.arrivalCleared() =
      AddressSelectionArrivalCleared;

  // ADDRESS TAPPED
  const factory AddressSelectionEvent.departureAddressSelected({
    required Address address,
    String? trainNumber,
    String? flightNumber,
    int? departureDelay,
    DateTime? date,
  }) = AddressSelectionDepartureAddressSelected;

  const factory AddressSelectionEvent.arrivalAddressSelected({
    required Address address,
  }) = AddressSelectionArrivalAddressSelected;
}
