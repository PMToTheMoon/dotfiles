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
  Future<void> write(Writer writer) {
    // build context
    // maybe from a singleton
    final object = build(BuildContext());
  }

  MetaObject build(BuildContext context) {}
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
