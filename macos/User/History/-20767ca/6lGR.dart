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

class UserPage {
  MetaObject build() {
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

class Path {
  final String path;

  MetaObject build() {}
}
