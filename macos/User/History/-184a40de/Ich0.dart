class BuildContext {}

abstract class MetaObject<T> {
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
