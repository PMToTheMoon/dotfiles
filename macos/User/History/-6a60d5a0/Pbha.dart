import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: homeAppBar(context, firstName: 'John', showAlertBadge: true),
        body: Padding(
          padding: const PaddingPageMedium.vertical(),
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
                      onTap: () {},
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
=======
    return Scaffold(
      appBar: homeAppBar(
        context,
        title: const Hello(),
        showAlertBadge: true,
      ),
      body: Padding(
        padding: const PaddingPageMedium.vertical(),
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
                    onTap: () {},
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
>>>>>>> lot1_home_bloc
        ),
      ),
    );
  }
}
