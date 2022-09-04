class RecordRepository {
  Future<List<String>> recordList(
    String id, {
    required int page,
    String? name,
    DateTime? before,
    DateTime? after,
  }) async =>
      [];
}
