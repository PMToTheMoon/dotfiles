class RecordRepository {
  Future<List<String>> recordList({
    required int page,
    String? name,
    DateTime? before,
    DateTime? after,
  }) async =>
      [];
}
