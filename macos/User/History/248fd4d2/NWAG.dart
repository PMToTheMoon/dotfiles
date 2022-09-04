import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomeRecordsList extends StatelessWidget {
  const HomeRecordsList({
    Key? key,
    this.data,
    this.placeholderCount = 3,
  }) : super(key: key);

  final int placeholderCount;
  final List<RecordCardData>? data;

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
