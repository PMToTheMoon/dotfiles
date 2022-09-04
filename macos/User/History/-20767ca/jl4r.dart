final recordRepo = RecordRepository();

final app = App(
  repositories: Rpositories([
    RecordRepository(),
  ]),
  skeleton: Skeleton({
    '/user': Page(
        repository: UserRepository()
        child: FetchListView(
          params: {
            'userId': userRepo.userId,
          },
          source: recordRepo.fetchReocordsForUser,
        ),
      ),
    },),
  );

class UserAppNode {
  final UserRepository userRepository,

  void build() {
    return Page(
        repository: UserRepository()
        child: FetchListView(
          params: {
            'userId': userRepo.userId,
          },
          source: recordRepo.fetchReocordsForUser,
        ),
      );
  }
}