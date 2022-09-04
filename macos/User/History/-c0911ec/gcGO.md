```dart


class XFetchBloc extends Seed {
  void grow() {
    return ParametrizedFetchBloc(
      subject: "PassengerList",
      source: repo.source,
      localFilters: {}
      transformer: MyTransformer()

    );
  }
}
```

Bloc extends Seed {
  void grow() {
    events Freezed();

    return Seeds([
      events
    ])
  }
}