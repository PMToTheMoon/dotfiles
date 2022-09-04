class BuildContext {}

abstract class MetaObject<T> {
  MetaObject({
    required this.root,
  });

  final String root;

  T build(BuildContext context);
}

class StreamViewBloMetaData {}

class StreamViewBloc extends MetaObject<StreamViewBloMetaData> {
  @override
  StreamViewBloMetaData build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

void build(MetaObject object) {}

void myMain() {
  build(
    StreamViewBloc(),
  );
}
