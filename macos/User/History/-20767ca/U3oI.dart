final recordRepo = RecordRepository();

final app = App(
  repositories: Rpositories([
    RecordRepository(),
  ]),
  skeleton: Skeleton({
    '/user': UserPage(),
    },
    ),
  );

class UserPage {
  final UserRepository userRepository,

  MetaObject build() {
    return Page(
        repository: serRepository,
        child: FetchListView(
          params: {
            'userId': userRepo.userId,
          },
          source: recordRepo.fetchReocordsForUser,
        ),
      );
  }
}