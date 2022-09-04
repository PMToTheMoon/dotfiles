# Blocs
## Stream view bloc
A bloc that subscribe to a stream a present the last received value.
```yaml
stream_view_bloc:
  subject: UserList
  state:
    type: List<User>
    import?: package:path/to/model.dart
  source?:
    type: ToBeTransformer
    import: package:path/to/model.dart
    transformer:
      path: hooks.dart
      name: _transformToBeTransformer
```