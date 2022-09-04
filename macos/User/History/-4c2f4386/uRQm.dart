import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/record/new_record/general/initial_observation/general_initial_observation_page.dart';

import 'hello/hello.dart';
import 'records/home_records_view.dart';

import 'widgets/home_action_card.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  static const route = 'route';

  static HomePage builder(BuildContext context) => const HomePage();

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        context,
        title: const Hello(),
        showAlertBadge: true,
      ),
      body: Padding(
        padding: const PaddingMedium(top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.badge,
                    text: context.l10n.home_action_create_patient,
                    color: context.colorScheme.primary,
                    backgroundColor: context.colorScheme.primaryContainer,
                    onTap: () {},
                  ),
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.edit,
                    text: context.l10n.home_action_create_journey,
                    color: context.colorScheme.secondary,
                    backgroundColor: context.colorScheme.secondaryContainer,
                    onTap: () => GeneralInitialObservationPage.open(context),
                  ),
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.edit,
                    text: 'Future-proof',
                    color: context.colorScheme.secondary,
                    backgroundColor: context.colorScheme.secondaryContainer,
                    onTap: () {},
                  ),
                  const SpaceSmall.w(),
                ],
              ),
            ),
            const SpaceMedium.h(),
            const Expanded(
              child: HomeRecords(),
            ),
          ],
        ),
      ),
    );
  }
}
