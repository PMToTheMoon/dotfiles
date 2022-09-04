class DummyRepository {
  DummyRepository();

  List<String> item(
    String id, {
    int page,
    String? name,
    DateTime? before,
    DateTime? after,
  });
}
