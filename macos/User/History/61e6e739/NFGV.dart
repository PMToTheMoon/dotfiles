import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/hub/hub.dart';

import '../widgets/home_action_card.dart';

class HomeRecords extends StatelessWidget {
  const HomeRecords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const _HomeRecords();
  }
}

class _HomeRecords extends StatefulWidget {
  const _HomeRecords();

  @override
  _HomeRecordsState createState() => _HomeRecordsState();
}

class _HomeRecordsState extends State<_HomeRecords> {
  _HomeRecordsState();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const PaddingPageMedium.vertical(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HighlightTabBar(
              tabs: [
                context.l10n.home_tab_in_progress,
                context.l10n.home_tab_high_priority,
                context.l10n.home_tab_draft,
              ],
            ),
            const Expanded(
              child: TabBarView(children: [
                HomeRecordsTabView(),
                HomeRecordsTabView(),
                HomeRecordsTabView(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class HomeRecordsTabView extends StatelessWidget {
  const HomeRecordsTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                image: AssetImage(Assets.images.launcherIcon.keyName),
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
                image: AssetImage(Assets.images.launcherIcon.keyName),
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
                image: AssetImage(Assets.images.launcherIcon.keyName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
