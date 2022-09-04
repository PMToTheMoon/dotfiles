export 'record_to_initial_observation.dart';
export 'record_to_complement.dart';
export 'rapport_to_card.dart';
export 'record_to_close.dart';

DateTime dateFromEpochOrPlaceholder(int? timestamp) {
  if (timestamp != null) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
  return DateTime(404);
}
