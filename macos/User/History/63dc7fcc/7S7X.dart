import 'dart:async';

class RecordRepository {
  Future<List<String>> recordList(
    String id, {
    required int page,
    String? name,
    DateTime? before,
    DateTime? after,
  }) async =>
      [];

  late final StreamController _recordStream = StreamController.broadcast();
  Stream get recordStream;
}
