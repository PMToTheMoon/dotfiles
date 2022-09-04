import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/home/records/home_records.dart';

import 'bloc/home_bloc.dart';
import 'widgets/home_action_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: homeAppBar(context, firstName: 'John', showAlertBadge: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.badge,
                    text: 'Céer un patient',
                    color: context.colorScheme.primary,
                    backgroundColor: context.colorScheme.primaryContainer,
                    onTap: () {},
                  ),
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.edit,
                    text: 'Céer un parcours',
                    color: context.colorScheme.secondary,
                    backgroundColor: context.colorScheme.secondaryContainer,
                    onTap: () {},
                  ),
                  const SpaceSmall.w(),
                  HomeActionCard(
                    icon: Icons.edit,
                    text: 'Céer un parcours',
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
