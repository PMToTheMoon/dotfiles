part of 'ui_kit_page.dart';

get _buildObservationCard => ObservationCard(
      ObservationCardData(
        date: DateTime.now(),
        doctor: ObservationCardDoctor(
          avatar: AssetImage(
            Assets.images.launcherIcon.keyName,
          ),
          firstName: 'Sophie',
          lastName: 'Lacour',
          subtitle: 'Institut mutualiste de Montsourtis',
          specialty: 'Cardiologue',
        ),
        parts: [
          const ObservationCardHiddenObservationData(
            observation: '''
Femme de 70 ans asymptomatique hormis 
quelques palpitations.
ETT: 0.4 cm2/m2, Vmax à 4.7 m/s, gradien moyen 
à 45 mmHg, HVG et FE à 45% ECG: BAVI BBDc
Patiente en bon état général, sportive, 
quasi-asymptomatique. Voir ecg
''',
          )
        ],
      ),
    );
