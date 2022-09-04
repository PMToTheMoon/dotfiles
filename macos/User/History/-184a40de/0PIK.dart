class BuildContext {}

abstract class MetaObject<T> {
  MetaObject({
    required this.root,
  });

  final String root;

  T build(BuildContext context);
}

class StreamViewBloc extends MetaObject {
  StreamViewBloc({required super.root});

  @override
  void build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

void build(MetaObject object) {}

void myMain() {
  build(
    StreamViewBloc(root: '/home'),
  );
}
