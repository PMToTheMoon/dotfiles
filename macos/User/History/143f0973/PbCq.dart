import 'package:app_client/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:neat/neat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart';
import 'package:app_client/profile/profile.dart';
import 'package:app_client/passengers/passengers.dart';
import 'package:app_client/payment_methods/payment_methods.dart';
import 'package:app_client/trip_list/trip_list.dart';
import 'package:app_client/external_pages/external_pages.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return navigationDrawer(context, [
      MenuItem.pageLink(
        context,
        icon: Icons.person,
        label: context.l10n.account_link,
        route: ProfilePage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.event_available,
        label: context.l10n.trip_list_link,
        route: TripListPage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.credit_card,
        label: context.l10n.payment_methods_link,
        route: PaymentMethodsPage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.person_add,
        label: context.l10n.passengers_link,
        route: PassengersPage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.assistant_photo,
        label: context.l10n.meet_points_link,
        route: MeetPointsPage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.message,
        label: context.l10n.support_link,
        route: SupportPage.route,
      ),
      MenuItem.pageLink(
        context,
        icon: Icons.info_outline,
        label: context.l10n.legal_mentions_link,
        route: LegalMentionsPage.route,
      ),
      const Space3.h(),
      MenuItem.text(
        context,
        context.l10n.logout_button,
        () => context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
        color: context.colorScheme.primary,
      ),
    ]);
  }
}
