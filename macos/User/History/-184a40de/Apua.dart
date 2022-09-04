class BuildContext {}

abstract class MetaObject<T> {
  MetaObject({
    this.root,
  });

  final String? root;

  T build(BuildContext context);
}

class StreamViewBloc extends MetaObject {
  StreamViewBloc({super.root});

  @override
  void build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Model extends MetaObject {
  Model({super.root});
}

void build(MetaObject object) {}

void myMain() {
  build(
    StreamViewBloc(root: '/home'),
  );
}
