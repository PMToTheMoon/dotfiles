# Two kind of repositories

Public repository
A repository that depend's depend of any special value.
It can be used at any time by any bloc

Private repository
A repository that depend's on other repository values. For example a repo that perform auth request depend on auth repository to be authenticated.
Another use case is when you have different types of users. Each user type often come with it's own repo to edit it's specifics data. That repos can't be used if user hasn't the correct type, it will throw err in theses cases.

Don't mix public and private method in same repository.
CandidatesRepo => every public method for public candidate queries. Can be used by every users.
CandidateRepo => every private method to manipulate a candidate. Can only be used by users who have right to.

How to manage error in repo?

# Guidlines
Use Streams where you can. Stream based data architecture have the avantage to avoid unsync bettween parts of your app.

Streams should come from repositories and bloc subscribe from them. Repo will also keep track of any data change and expose sync getters to access last data state. 

Bloc will follow this pattern:
1 take repository in constructor.
2 subscribe to the repository stream like so:
~~```dart~~
~~//Don't forget to cancel() subscription !~~
~~userStreamSubscription = userRepository.userStream.listen(~~
~~    (user) => add(UserChanged(user)),~~
~~);~~
~~```~~~

```dart
on<Started>((event, emit) async {
    //init logic
    final initialData = repo.data;
    if (data == null) {
        // careful! if you're repo isn't async, this will not work cause 
        // we fon"t have subscribed stream yet
        repo.fetchData();
    } else {
        emit(State(data));
    }
    //then
    return emit.forEach(repo.dataStream, (data) => State(data));
});
```