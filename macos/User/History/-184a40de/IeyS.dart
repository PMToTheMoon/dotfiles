class BuildContext {}

abstract class MetaObject<T> {
  MetaObject({
    this.root,
  });

  final String? root;

  T build(BuildContext context);
}

class StreamViewBloc extends MetaObject {
  StreamViewBloc({
    super.root,
    required this.state,
  });

  final Model state;

  @override
  void build(BuildContext context) {
    throw UnimplementedError();
  }
}

class Model extends MetaObject {
  Model(
    this.name,
    this.type, {
    super.root,
  });

  final String name;
  final Map<String, dynamic> type;

  @override
  void build(BuildContext context) {
    throw UnimplementedError();
  }
}

void build(MetaObject object) {}

void myMain() {
  build(
    StreamViewBloc(
      root: '/home',
      state: Model(
        'RecordState',
        {
          'values': 'String',
          'field': 'int',
        },
      ),
    ),
  );
}

/// Inconvenients:
/// 
/// Comment un générateur peur 'feed' en enfant basé sur ces propres paramètres
///