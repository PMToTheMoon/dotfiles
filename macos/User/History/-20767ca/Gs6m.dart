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
