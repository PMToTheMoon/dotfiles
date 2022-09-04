final recordRepo = RecordRepository();

final app = App(
  repositories: Rpositories([
    RecordRepository(),
  ]),
  skeleton: Skeleton(
    {
      '/user': UserPage(),
    },
  ),
);

abstract class MetaSource {
  /// Write files on disk
  Future<void> write(Writer writer);
}

class MetaObject implements MetaSource {
  Future<void> write(Writer writer) {}

  Widget build() {}
}

class UserPage extends MetaObject {
  MetaObject build(BuildContext context) {
    final userRepo;

    return Page(
      repository: userRepo,
      child: FetchListView(
        params: {
          'userId': userRepo.userId,
        },
        source: recordRepo.fetchReocordsForUser,
      ),
    );
  }
}

class ListView {
  final fetchBloc;
}
