import 'package:app_client/user/user.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import '/passengers/passengers.dart';

class PassengersPage extends StatelessWidget {
  static const String route = "/passengers";
  static Widget builder(_) => const PassengersPage();

  const PassengersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassengersBloc(
        userRepository: context.read(),
      ),
      child: Page(
        appBar: titledAppBar(
          context,
          title: context.l10n.passengers_page_title,
          action: IconButton(
            onPressed: () => NewPassengerPage.open(context),
            icon: Icon(
              Icons.add_box_outlined,
              color: context.colorScheme.onSurface,
            ),
          ),
        ),
        body: const _PassengersPageBody(),
      ),
    );
  }
}

class _PassengersPageBody extends StatelessWidget {
  const _PassengersPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfos = context.select((UserBloc bloc) => bloc.user.infos);
    final passengers =
        context.select((UserBloc bloc) => bloc.user.favoritePassengers);
    final selectedPassengerID =
        context.select((UserBloc bloc) => bloc.user.defaultPassenger?.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Passenger(
          Passenger(
              id: -1,
              email: userInfos.email,
              firstName: userInfos.firstName,
              lastName: userInfos.lastName,
              mobile: userInfos.mobileA),
          selected: selectedPassengerID == null,
          onPressed: () => context
              .read<PassengersBloc>()
              .add(const PassengersEvent.passengerSelected(null)),
        ),
        ...passengers
            .map(
              (passenger) => _Passenger(
                passenger,
                selected: passenger.id == selectedPassengerID,
                onPressed: () => context
                    .read<PassengersBloc>()
                    .add(PassengersEvent.passengerSelected(passenger.id)),
              ),
            )
            .toList(),
      ],
    );
  }
}

const double _iconSize = Dimensions.icon2;

class _Passenger extends StatelessWidget {
  const _Passenger(
    this.passenger, {
    this.selected = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final Passenger passenger;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const Padding4.vertical(),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              size: _iconSize,
            ),
            const Space4.w(),
            Expanded(
              child: context.subtitle2(
                "${passenger.firstName.toCapitalized} ${passenger.lastName.toCapitalized}",
              ),
            ),
            _SelectedIcon(selected),
          ],
        ),
      ),
    );
  }
}

class _SelectedIcon extends StatelessWidget {
  const _SelectedIcon(
    this.selected, {
    Key? key,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return selected
        ? const Icon(
            Icons.radio_button_checked,
            size: _iconSize,
            color: Colors.black,
          )
        : const Icon(
            Icons.radio_button_off,
            size: _iconSize,
            color: Colors.black,
          );
  }
}
