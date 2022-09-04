part of 'ui_kit_page.dart';

ObservationCard get _buildObservationCard => ObservationCard(
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
quasi-asymptomatique. Voir ecg''',
          ),
          const ObservationCardDataPart.patientObservation(observation: '''
Le patient ne présente pas de pathologie 
nécéssitant une contre indication à la pratique 
sportive'''),
          const ObservationCardDataPart.medicalHistory(items: {
            'Vasculaire',
            'Test',
            'Un autre',
          }),
          const ObservationCardDataPart.treatments(items: {
            'Doliprane',
            'Padamalgam',
          }),
          const ObservationCardDataPart.additionalObservation(observation: '''
En l’absence de symptôme et devant l’absence
de trouble de conduction paroxystique ou de
pause diurne au holter, il faut poursuivre la
surveillance clinique et refaire un holter tous les 6
mois avant d’envisager une prise en charge
rythmologique si besoin''')
        ],
      ),
    );
