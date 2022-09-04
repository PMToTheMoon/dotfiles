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
    emit(State(
        repo.data
    ))

    }
    //then
    return emit.forEach(repo.dataStream, (data) => State(data));
});
```

3 initialize themself with sync getter
```dart
add(Started(userRepository.user));
```