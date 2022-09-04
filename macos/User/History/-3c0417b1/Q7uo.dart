import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:common/common.dart';
import 'package:app_client/address_selection/address_selection.dart';

part '_bottom.dart';

class AddressSelectionPage extends StatelessWidget {
  static const String route = "/address_selection";

  static Future<AddressSelectionResult> open(
    BuildContext context,
    AddressSelectionPageArguments arguments,
  ) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddressSelectionPage(arguments: arguments),
      ),
    );
    return result as AddressSelectionResult;
  }

  const AddressSelectionPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final AddressSelectionPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressSelectionBloc(
        initialDate: arguments.initialDate,
        initialFocus: arguments.initialFocus,
        initialDeparture: arguments.initialDeparture,
        initialArrival: arguments.initialArrival,
        initialDepartureDelay: arguments.initialDepartureDelay,
        initialFlightNumber: arguments.initialFlightNumber,
        initialTrainNumber: arguments.initialTrainNumber,
        userRepository: context.read(),
        addressSuggestionsProvider: AddressSuggestionsProvider(
          authRepository: context.read(),
        ),
      ),
      child: _AddressSelectionPageBody(
        arguments: arguments,
      ),
    );
  }
}

class _AddressSelectionPageBody extends StatefulWidget {
  const _AddressSelectionPageBody({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final AddressSelectionPageArguments arguments;

  @override
  _AddressSelectionPageBodyState createState() =>
      _AddressSelectionPageBodyState();
}

class _AddressSelectionPageBodyState extends State<_AddressSelectionPageBody> {
  _AddressSelectionPageBodyState();

  final _controller = DepartureArrivalFieldController();
  final Key _departureArrivalKey = GlobalKey();

  @override
  void initState() {
    final state = context.read<AddressSelectionBloc>().state;
    switch (state.currentFocus) {
      case AddressSelectionFocus.departure:
        _controller.focusDeparture();
        break;
      case AddressSelectionFocus.arrival:
        _controller.focusArrival();
        break;
    }
    _controller.departure = state.selectedDepartureAddress?.label ?? "";
    _controller.arrival = state.selectedArrivalAddress?.label ?? "";
    super.initState();
  }

  void goBack() {
    final _state = context.read<AddressSelectionBloc>().state;
    Navigator.of(context).pop(_state.returnValue);
  }

  Future<void> addressSelected(Address address, bool isDeparture) async {
    DateTime? date;
    String? trainNumber;
    String? flightNumber;
    int? departureDelay;
    Address _selectedAddress = address;
    if (isDeparture && address.type == AddressType.train) {
      final result = await TrainNumberSelectionPage.open(
        context,
        const TrainNumberSelectionPageArguments(),
      );
      trainNumber = result.trainNumber;
    } else if (isDeparture && address.type == AddressType.airport) {
      final state = context.read<AddressSelectionBloc>().state;
      final result = await FlightNumberSelectionPage.open(
        context,
        FlightNumberSelectionPageArguments(
          date: state.date,
        ),
      );
      date = result?.date;
      flightNumber = result?.flightNumber;
      departureDelay = result?.departureDelay;
      _selectedAddress = result?.departureAirport ?? address;
    }

    final bloc = context.read<AddressSelectionBloc>();
    bloc.add(AddressSelectionEvent.addressSelected(
      address: _selectedAddress,
      trainNumber: trainNumber,
      flightNumber: flightNumber,
      departureDelay: departureDelay,
      date: date,
    ));

    switch (bloc.state.currentFocus) {
      case AddressSelectionFocus.departure:
        _controller.departure = _selectedAddress.label;
        focusArrival();
        _controller.focusArrival();
        break;
      case AddressSelectionFocus.arrival:
        _controller.arrival = _selectedAddress.label;
        focusDeparture();
        _controller.focusDeparture();
        break;
    }
  }

  void focusDeparture() {
    context
        .read<AddressSelectionBloc>()
        .add(const AddressSelectionEvent.departureFocused());
  }

  void focusArrival() {
    context
        .read<AddressSelectionBloc>()
        .add(const AddressSelectionEvent.arrivalFocused());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((AddressSelectionBloc bloc) => bloc.state);
    late Widget content;

    switch (state.status) {
      case AddressSelectionStatus.success:
        content = _AddressList(
          onAddressSelected: (address) => addressSelected(
            address,
            state.currentFocus == AddressSelectionFocus.departure,
          ),
        );
        break;
      case AddressSelectionStatus.error:
        content = const ErrorIndicator();
        break;
      case AddressSelectionStatus.done:
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) => goBack());
        content = const Center(child: CircularProgressIndicator());
        break;
      default:
        content = const Center(child: CircularProgressIndicator());
        break;
    }

    return WillPopScope(
      onWillPop: () async {
        goBack();
        return false;
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) => [
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    final _state = context.read<AddressSelectionBloc>().state;
                    Navigator.of(context).pop(_state.returnValue);
                  },
                ),
                title: Text(context.l10n.trip_list_page_title),
                primary: true,
                floating: true,
                collapsedHeight: 130,
                expandedHeight: 130,
                centerTitle: true,
                bottom: _Bottom(
                  controller: _controller,
                  departureArrivalKey: _departureArrivalKey,
                ),
              ),
            ],
            body: content,
          ),
        ),
      ),
    );
  }
}

class _AddressTypeSelector extends StatelessWidget {
  const _AddressTypeSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filter = context.select(
      (AddressSelectionBloc bloc) => bloc.state.filter,
    );
    return Wrap(
      alignment: WrapAlignment.center,
      children: AddressType.values
          .map(
            (type) => _AddressTypePin(
              type: type,
              selected: type == filter,
              onPressed: () => context
                  .read<AddressSelectionBloc>()
                  .add(AddressSelectionEvent.filterChanged(type)),
            ),
          )
          .toList(),
    );
  }
}

class _AddressTypePin extends StatelessWidget {
  const _AddressTypePin({
    required this.type,
    required this.selected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final AddressType type;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const Padding5.all(),
      child: OutlinedButton(
        child: Text(type.display(context)),
        style: ButtonStyle(
          side: BorderSide(
            width: selected ? 2 : 1,
            color: selected
                ? context.colorScheme.primary
                : context.theme.dividerColor,
          ).msp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ).msp,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

extension _DisplayAddressType on AddressType {
  String display(BuildContext context) {
    switch (this) {
      case AddressType.location:
        return context.l10n.address_filter;
      case AddressType.airport:
        return context.l10n.airport_filter;
      case AddressType.train:
        return context.l10n.train_filter;
    }
  }
}

class _AddressList extends StatelessWidget {
  const _AddressList({
    Key? key,
    required this.onAddressSelected,
  }) : super(key: key);

  final ValueChanged<Address> onAddressSelected;

  @override
  Widget build(BuildContext context) {
    final addresses =
        context.select((AddressSelectionBloc bloc) => bloc.state.suggestions);
    if (addresses.isEmpty) return const EmptyListIndicator();

    return ListView.separated(
      separatorBuilder: (context, index) => const Space4.h(),
      itemBuilder: (context, index) => _Address(
        addresses[index],
        () => onAddressSelected(addresses[index]),
      ),
      itemCount: addresses.length,
    );
  }
}

class _Address extends StatelessWidget {
  const _Address(
    this.address,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final Address address;
  final VoidCallback onTap;

  IconData get icon {
    switch (address.type) {
      case AddressType.airport:
        return Icons.airplane_ticket;
      case AddressType.train:
        return Icons.train;
      default:
        return Icons.map;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Padding(
          padding: const PaddingPage.horizontal(),
          child: Row(
            children: [
              Icon(icon),
              const Space5.w(),
              Expanded(child: context.subtitle1(address.label)),
            ],
          ),
        ),
      ),
    );
  }
}
