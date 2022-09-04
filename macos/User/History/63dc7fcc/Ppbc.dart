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

  // late final StreamController _recordStreamController =
  //     StreamController.broadcast();
  // Stream get recordStream => _recordStreamController.stream;
  // String? _record;
  // String? get record => _record;
  // set record(String? newValue) {
  //   _record = newValue;
  //   _recordStreamController.add(newValue);
  // }

  // Future<String> fetchRecordForUser(String id) async {
  //   final res = await _client.fetchRecordForUser(id);
  //   record = res;
  //   return res;
  // }
}
