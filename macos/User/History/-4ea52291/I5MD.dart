import 'package:app_client/trip_details/trip_details.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';

import 'package:common/common.dart';
import 'package:app_client/trip_list/trip_list.dart';

import 'trip_tab_bar.dart';

class TripListPage extends StatelessWidget {
  static const String route = "/trip_list";

  static Widget builder(BuildContext context) => const TripListPage();

  static Future<void> open(
    BuildContext context,
  ) =>
      Navigator.of(context).pushNamed(
        route,
      );

  static void goBack(
    BuildContext context,
  ) =>
      Navigator.of(context).pop();

  const TripListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripListBloc(
        userRepository: context.read(),
      ),
      child: const _TripListPage(),
    );
  }
}

class _TripListPage extends StatelessWidget {
  const _TripListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titledAppBar(context, title: context.l10n.trip_list_page_title),
      backgroundColor: context.colorScheme.surfaceVariant,
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                  top: kToolbarHeight //+ Dimensions.paddingPage,
                  ),
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  _IncomingTripList(),
                  _PastTripList(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
              child: TripTabBar(
                padding: const Padding3.all(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IncomingTripList extends StatelessWidget {
  const _IncomingTripList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((TripListBloc bloc) => bloc.state);
    if (state is! TripListLoaded) {
      return const LoadingIndicator();
    }
    return _TripList(
      state.incomingTrips,
    );
  }
}

class _PastTripList extends StatelessWidget {
  const _PastTripList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((TripListBloc bloc) => bloc.state);
    if (state is! TripListLoaded) {
      return const Center(child: CircularProgressIndicator());
    }
    return _TripList(state.pastTrips);
  }
}

class _TripList extends StatelessWidget {
  const _TripList(
    this.trips, {
    Key? key,
  }) : super(key: key);

  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) return const EmptyListIndicator();
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: Dimensions.padding2,
        bottom: Dimensions.padding2,
        left: Dimensions.paddingPage,
        right: Dimensions.paddingPage,
      ),
      itemCount: trips.length,
      itemBuilder: (context, index) => TripCard(
        trips[index],
        onTap: () => TripDetailsPage.open(
          context,
          TripDetailsPageArguments(trips[index]),
        ),
      ),
      separatorBuilder: (context, _) => const Space4.h(),
    );
  }
}
