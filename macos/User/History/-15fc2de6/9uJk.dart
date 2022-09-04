import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:intl/intl.dart';

import 'package:common/common.dart';
import 'package:common/theme/colors.dart' as ub;
import '/reservation/reservation.dart' hide ReservationForm;
import '/passengers/passengers.dart';
import '/payment_methods/payment_methods.dart';
import '/address_selection/address_selection.dart';

part '_price.dart';
part '_link_button.dart';
part '_vehicle_selector.dart';
part '_command_button.dart';
part '_command_recap_dialog.dart';
part '_payment_method_button.dart';
part '_passenger_button.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({
    this.departureInitialValue,
    this.arrivalInitialValue,
    Key? key,
  }) : super(key: key);

  final String? departureInitialValue;
  final String? arrivalInitialValue;

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  _ReservationFormState();

  late final _controller = DepartureArrivalFieldController(
    departureInitialValue: widget.departureInitialValue,
    arrivalInitialValue: widget.arrivalInitialValue,
  );
  final Key _departureArrivalKey = GlobalKey();

  bool get freezed => context.read<ReservationBloc>().state.freezForm;

  void onVehicleSelected(Vehicle vehicle) {
    if (freezed) return;
    context.read<ReservationBloc>().add(
          ReservationEvent.vehicleSelected(
            vehicle,
          ),
        );
  }

  Future<void> _onDepartureTapped() async {
    if (freezed) return;
    final _state = context.read<ReservationBloc>().state;
    final result = await AddressSelectionPage.open(
      context,
      AddressSelectionPageArguments.focusDeparture(
        initialDeparture: _state.departure,
        initialArrival: _state.arrival,
        initialDate: _state.date,
        initialDepartureDelay: _state.departureDelay ?? 0,
        initialFlightNumber: _state.flightNumber,
        initialTrainNumber: _state.trainNumber,
      ),
    );
    context
        .read<ReservationBloc>()
        .add(ReservationEvent.addressesSelected(result));
  }

  Future<void> _onArrivalTapped() async {
    if (freezed) return;
    final _state = context.read<ReservationBloc>().state;
    final result = await AddressSelectionPage.open(
      context,
      AddressSelectionPageArguments.focusArrival(
        initialDeparture: _state.departure,
        initialArrival: _state.arrival,
        initialDate: _state.date,
        initialDepartureDelay: _state.departureDelay ?? 0,
        initialFlightNumber: _state.flightNumber,
        initialTrainNumber: _state.trainNumber,
      ),
    );
    context
        .read<ReservationBloc>()
        .add(ReservationEvent.addressesSelected(result));
  }

  @override
  Widget build(BuildContext context) {
    final ReservationState state =
        context.select((ReservationBloc bloc) => bloc.state);

    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    return _buildForm(state);
  }

  Widget _buildForm(ReservationState state) {
    final String? addressesError =
        (state.areAddressesFilled && !state.areAddressesDifferent)
            ? context.l10n.departure_arrival_identical_error
            : null;

    return BlocListener<ReservationBloc, ReservationState>(
      listenWhen: (previous, next) => (previous.departure != next.departure ||
          previous.arrival != next.arrival),
      listener: (context, _state) {
        _controller.departure = _state.departure?.label ?? "";
        _controller.arrival = _state.arrival?.label ?? "";
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _VehicleSelector(
            selected: state.vehicle!,
            onVehicleSelected: onVehicleSelected,
          ),
          const Space5.h(),
          DatePickerButton(
            minuteInterval: kReservationMinuteIntervale,
            enabled: freezed == false,
            date: state.dateWithDepartureDelay,
            onDateSelected: (selected) => context
                .read<ReservationBloc>()
                .add(ReservationEvent.dateSelected(selected)),
          ),
          if (state.dateWithDepartureDelay?.isBefore(DateTime.now()) ??
              false == true)
            const Space5.h(),
          DepartureArrivalField(
            key: _departureArrivalKey,
            controller: _controller,
            onDepartureTapped: _onDepartureTapped,
            onArrivalTapped: _onArrivalTapped,
            enabled: false,
          ),
          if (addressesError != null)
            Padding(
              padding: const Padding5(left | top),
              child: context.bodyText1(
                addressesError,
                style: TextStyle(color: context.colorScheme.error),
              ),
            ),
          const Space5.h(),
          const _Price(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: const [
              _PaymentMethodButton(),
              Space5.w(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _PassengerButton(),
                ),
              ),
            ],
          ),
          const Space5.h(),
          const CommandButton(),
        ],
      ),
    );
  }
}
