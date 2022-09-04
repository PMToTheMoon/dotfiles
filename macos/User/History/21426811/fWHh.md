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

# Two kind of data
Fetchable and Streamable
fetchable for one shot query data that does'nt depend on any other data type
streamble if data can change over time, for exemple a list where you can perform crud op on it


// reactive repo sub
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