class BuildContext<Input, Output> {
  Output build(MetaObject<Input, Output> object, Input input) {
    ;
    object.build(BuildContext());
  }
}

abstract class MetaObject<I, O> {
  MetaObject({
    this.root,
  });

  final String? root;

  O build(BuildContext<I> context);
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
  void build(BuildContext context, StreamViewBlocInput input) {
    model.build(
        context,
        ModelInput(
          input.subject,
          input.stateFields,
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
  void build(BuildContext context, ModelInput input) {
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
  void build(BuildContext context, ListViewInput input) {
    bloc.build(
      context,
      StreamViewBlocInput(subject: input.subject, stateFields: stateFields),
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