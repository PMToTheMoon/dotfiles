export 'record_to_initial_observation.dart';
export 'record_to_complement.dart';

DateTime dateFromEpochOrPlaceholder(int? timestamp) {
  if (timestamp != null) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }
  return DateTime(404);
}
