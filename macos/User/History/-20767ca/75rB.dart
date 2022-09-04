final recordRepo = RecordRepository();

final app = App(
  repositories: Rpositories([
    RecordRepository(),
  ]),
  skeleton: Skeleton({
    '/user': RepositoryProvider(
      child: Page(
        child: FetchListView(
          params: {
            'userId': userRepo.userId,
          },
          source: recordRepo.fetchReocordsForUser,
        ),
      ),
    ),
  }),
);
