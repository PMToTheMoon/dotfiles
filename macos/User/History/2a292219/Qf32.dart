import 'package:common/common.dart';
import 'package:app_client/user/user.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:app_client/address_selection/address_selection.dart';
part 'address_selection_bloc.freezed.dart';
part 'address_selection_event.dart';
part 'address_selection_state.dart';

const _searchDebounceDuration = Duration(seconds: 1);

Stream<T> _debounce<T>(
  Stream<T> events,
  Stream<T> Function(T) mapper,
) =>
    events.throttleTime(_searchDebounceDuration).flatMap(mapper);

class AddressSelectionBloc
    extends Bloc<AddressSelectionEvent, AddressSelectionState> {
  AddressSelectionBloc({
    required AddressSelectionFocus initialFocus,
    Address? initialDeparture,
    Address? initialArrival,
    required this.userRepository,
    required this.addressSuggestionsProvider,
    DateTime? initialDate,
    String? initialTrainNumber,
    String? initialFlightNumber,
    int? initialDepartureDelay,
  }) : super(
          AddressSelectionState(
            AddressSelectionStatus.initial,
            currentFocus: initialFocus,
            selectedDepartureAddress: initialDeparture,
            selectedArrivalAddress: initialArrival,
            date: initialDate,
            trainNumber: trainNumber,
            flightNumber: flightNumber,
            departureDelay: departureDelay,
          ),
        ) {
    on<AddressSelectionFavoriteAddressesReceived>(_onFavoriteAddressesReceived);
    on<AddressSelectionFilterChanged>(_onFilterChanged);
    on<AddressSelectionAddressSelected>(_onAddressSelected);

    // Departure
    on<AddressSelectionDepartureFocused>(_onDepartureFocused);
    on<AddressSelectionDepartureChanged>(_onDepartureChanged,
        transformer: _debounce);
    on<AddressSelectionDepartureCleared>(_onDepartureCleared);

    // arrival
    on<AddressSelectionArrivalFocused>(_onArrivalFocused);
    on<AddressSelectionArrivalChanged>(_onArrivalChanged,
        transformer: _debounce);
    on<AddressSelectionArrivalCleared>(_onArrivalCleared);
    _init();
  }

  final UserRepository userRepository;
  final AddressSuggestionsProvider addressSuggestionsProvider;

  void _init() {
    final favorites = userRepository.favoriteAddresses;
    add(AddressSelectionEvent.favoriteAddressesReceived(favorites ?? []));
  }

  void _onFavoriteAddressesReceived(
    AddressSelectionFavoriteAddressesReceived event,
    Emitter<AddressSelectionState> emit,
  ) {
    emit(state.copyWith(
      status: AddressSelectionStatus.success,
      favoriteAddresses: event.favoriteAddresses,
    ));
  }

  void _onDepartureFocused(_, Emitter<AddressSelectionState> emit) {
    emit((state.copyWith(currentFocus: AddressSelectionFocus.departure)));
  }

  Future<void> _onDepartureChanged(
    AddressSelectionDepartureChanged event,
    Emitter<AddressSelectionState> emit,
  ) async {
    if (event.value == state.selectedDepartureAddress?.label) return;
    emit(state.copyWith(
      status: AddressSelectionStatus.loading,
      currentFocus: AddressSelectionFocus.departure,
      selectedDepartureAddress: null,
    ));
    try {
      final suggestions = await addressSuggestionsProvider.suggest(event.value);
      emit(state.copyWith(
        status: AddressSelectionStatus.success,
        departureSuggestions: suggestions,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: AddressSelectionStatus.error,
      ));
    }
  }

  void _onDepartureCleared(_, Emitter emit) {
    emit(state.copyWith(
      selectedDepartureAddress: null,
    ));
  }

  Future<void> _onArrivalChanged(
    AddressSelectionArrivalChanged event,
    Emitter<AddressSelectionState> emit,
  ) async {
    if (event.value == state.selectedArrivalAddress?.label) return;
    emit(state.copyWith(
      status: AddressSelectionStatus.loading,
      currentFocus: AddressSelectionFocus.arrival,
      selectedArrivalAddress: null,
    ));
    try {
      final suggestions = await addressSuggestionsProvider.suggest(event.value);
      emit(state.copyWith(
        status: AddressSelectionStatus.success,
        arrivalSuggestions: suggestions,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: AddressSelectionStatus.error,
      ));
    }
  }

  void _onArrivalCleared(_, Emitter emit) {
    emit(state.copyWith(
      selectedArrivalAddress: null,
    ));
  }

  void _onArrivalFocused(_, Emitter<AddressSelectionState> emit) {
    emit((state.copyWith(currentFocus: AddressSelectionFocus.arrival)));
  }

  void _onAddressSelected(
    AddressSelectionAddressSelected event,
    Emitter<AddressSelectionState> emit,
  ) async {
    switch (state.currentFocus) {
      case AddressSelectionFocus.departure:
        emit(state.copyWith(
          selectedDepartureAddress: event.address,
          filter: AddressType.location,
          status: state.selectedArrivalAddress != null
              ? AddressSelectionStatus.done
              : AddressSelectionStatus.success,
          trainNumber: event.trainNumber ?? state.trainNumber,
          flightNumber: event.flightNumber ?? state.flightNumber,
          departureDelay: event.departureDelay ?? state.departureDelay,
          date: event.date ?? state.date,
        ));
        break;

      case AddressSelectionFocus.arrival:
        emit(state.copyWith(
          filter: AddressType.location,
          selectedArrivalAddress: event.address,
          status: state.selectedDepartureAddress != null
              ? AddressSelectionStatus.done
              : AddressSelectionStatus.success,
          trainNumber: event.trainNumber ?? state.trainNumber,
          flightNumber: event.flightNumber ?? state.flightNumber,
          departureDelay: event.departureDelay ?? state.departureDelay,
        ));
        break;
    }
  }

  void _onFilterChanged(
    AddressSelectionFilterChanged event,
    Emitter<AddressSelectionState> emit,
  ) {
    emit(state.copyWith(
      filter: event.filer,
    ));
  }
}
