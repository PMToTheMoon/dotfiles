class BuildContext {}

abstract class MetaObject<I, O> {
  MetaObject({
    this.root,
  });

  final String? root;

  O build(BuildContext context, I input);
}

class StreamViewBlocInput {
  StreamViewBlocInput({
    required this.stateFields,
  });

  final Map<String, dynamic> stateFields;
}

class StreamViewBloc extends MetaObject<StreamViewBlocInput, void> {
  StreamViewBloc({super.root});

  @override
  void build(BuildContext context, StreamViewBlocInput input) {
    build(Model(), input);
    throw UnimplementedError();
  }
}

class ModelInput {
  ModelInput(
    this.name,
    this.type,
  );
  final String name;
  final Map<String, dynamic> type;
}

class Model extends MetaObject<ModelInput, void> {
  Model({super.root});

  @override
  void build(BuildContext context, void input) {
    throw UnimplementedError();
  }
}

void build<I, O>(MetaObject<I, O> object, I input) {}

void myMain() {
  build(
    StreamViewBloc(),
    StreamViewBlocInput(stateFields: {
      'field': 'String',
    }),
  );
}

/// Inconvenients:
/// 
/// Comment un générateur peur 'feed' en enfant basé sur ces propres paramètres
///