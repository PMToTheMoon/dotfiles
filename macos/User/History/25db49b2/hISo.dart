part of 'address_selection_bloc.dart';

enum AddressSelectionStatus {
  initial,
  loading,
  success,
  error,
  done,
}

@freezed
class AddressSelectionState with _$AddressSelectionState {
  const AddressSelectionState._();

  const factory AddressSelectionState(
    AddressSelectionStatus status, {
    required AddressSelectionFocus currentFocus,
    @Default(AddressType.location) AddressType filter,
    List<FavoriteAddress>? favoriteAddresses,
    List<SuggestedAddress>? departureSuggestions,
    List<SuggestedAddress>? arrivalSuggestions,
    Address? selectedDepartureAddress,
    Address? selectedArrivalAddress,
    String? trainNumber,
    String? flightNumber,
    int? departureDelay,
    DateTime? date,
  }) = _AddressSelectionState;

  List<Address> get suggestions {
    late List<Address> _raw;
    switch (currentFocus) {
      case AddressSelectionFocus.departure:
        _raw = [...?favoriteAddresses, ...?departureSuggestions];
        break;
      case AddressSelectionFocus.arrival:
        _raw = [...?favoriteAddresses, ...?arrivalSuggestions];
        break;
    }
    return _raw.where((a) => a.type == filter).toList();
  }

  bool get bothAddressSelected =>
      selectedDepartureAddress != null && selectedArrivalAddress != null;

  AddressSelectionResult get returnValue => AddressSelectionResult(
        departureAddress: selectedDepartureAddress,
        arrivalAddress: selectedArrivalAddress,
        departureTrainNumber: trainNumber,
        departureFlightNumber: flightNumber,
        departureDelay: departureDelay,
      );
}
