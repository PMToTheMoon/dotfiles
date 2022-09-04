import 'observation_card_data_part.dart';

class ObservationCardData {
  const ObservationCardData({
    required this.doctor,
    required this.date,
  });

  final ObservationCardIdentityData doctor;
  final DateTime date;
  final List<ObservationCardDataPart> parts;
}
