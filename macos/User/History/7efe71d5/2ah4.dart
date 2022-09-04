class BuildContext<Input, Output> {
  BuildContext({
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Input input;

  final String _root;

  Output build(MetaObject<Input, Output> object, Input input) {
    return object.build(BuildContext(input: input, root: _root + object.root));
  }
}

abstract class MetaObject<I, O> {
  MetaObject({
    this.root,
  });

  final String? root;

  O build(BuildContext<I, O> context);
}

class StreamViewBlocInput {
  StreamViewBlocInput({
    required this.subject,
    required this.stateFields,
  });

  final String subject;
  final Map<String, dynamic> stateFields;
}

class StreamViewBloc extends MetaObject<StreamViewBlocInput, void> {
  StreamViewBloc({
    super.root,
    required this.model,
  });

  final Model model;

  @override
  void build(BuildContext context) {
    context.build(
        model,
        ModelInput(
          context.input.subject,
          context.input.stateFields,
        ));
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
  void build(BuildContext context) {
    throw UnimplementedError();
  }
}

class ListViewInput {
  ListViewInput({
    required this.subject,
  });

  final String subject;
}

class ListView extends MetaObject<ListViewInput, void> {
  ListView({
    super.root,
    required this.bloc,
  });

  final StreamViewBloc bloc;

  @override
  void build(BuildContext context) {
    context.build(
      bloc,
      StreamViewBlocInput(
        subject: context.input.subject,
        stateFields: context.stateFields,
      ),
    );
  }
}

void buildObject<I, O>(MetaObject<I, O> object, I input) {}

void myMain() {
  buildObject(
    Page(),
    PageInput(
      body: {
        ListView(
          bloc: StreamViewBloc(
            model: Model(),
          ),
        ): ListViewInput(
          subject: 'test',
        )
      },
    ),
  );

  buildObject(
    StreamViewBloc(
      model: Model(),
    ),
    StreamViewBlocInput(
      subject: 'HomeRecords',
      stateFields: {
        'field': 'String',
      },
    ),
  );
}

/// Inconvenients:
/// 
/// + verbose
///