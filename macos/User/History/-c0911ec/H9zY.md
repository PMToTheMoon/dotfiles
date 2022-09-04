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

  void build() {
    super.build();
    freezed.meta;
  }
  events Freezed();

  void grow(step) {
    return Seeds([
      events
    ])
  }
}

freezed.types['x'].file;
freezed.types['x'].constructor;

Freezed extends Seed {

  types Map<String, FreezedType>{}:

  void grow() {
    return Seeds([
      events
    ])
  }
}