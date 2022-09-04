import 'observation_card_data_part.dart';

class ObservationCardDoctor {
  const ObservationCardDoctor({
    required ImageProvider avatar,
    required String firstName,
    required String lastName,
    required String subtitle,
    required String specialty,
  });
}

class ObservationCardData {
  const ObservationCardData({
    required this.doctor,
    required this.date,
    required this.parts,
  });

  final ObservationCardIdentityData doctor;
  final DateTime date;
  final List<ObservationCardDataPart> parts;
}
