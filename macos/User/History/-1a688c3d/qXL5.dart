import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: homeAppBar(context, firstName: 'John', showAlertBadge: true),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const PaddingPageMedium.vertical(),
            child: Column(
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
                const HighlightTabBar(
                  tabs: ['En cours', 'Prioritaire', 'Brouillon'],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const PaddingSmall(),
                    child: Column(
                      children: [
                        RecordCard(
                          data: RecordCardData.withStatus(
                            patientFirstName: 'Sophie',
                            patientLastName: 'Lacour',
                            recordTitle: 'Général',
                            progress: 0.3,
                            status: Status.hight,
                            image:
                                AssetImage(Assets.images.launcherIcon.keyName),
                          ),
                        ),
                        const SpaceSmaller.h(),
                        RecordCard(
                          data: RecordCardData.withStatus(
                            patientFirstName: 'Sophie',
                            patientLastName: 'Lacour',
                            recordTitle: 'Général',
                            progress: 0.6,
                            status: Status.medium,
                            image:
                                AssetImage(Assets.images.launcherIcon.keyName),
                          ),
                        ),
                        const SpaceSmaller.h(),
                        RecordCard(
                          data: RecordCardData.withStatus(
                            patientFirstName: 'Sophie',
                            patientLastName: 'Lacour',
                            recordTitle: 'Général',
                            progress: 0.9,
                            status: Status.low,
                            image:
                                AssetImage(Assets.images.launcherIcon.keyName),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
