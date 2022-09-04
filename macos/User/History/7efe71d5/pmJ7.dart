class BuildContext<Data, Output> {
  BuildContext({
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Data input;

  // TODO: packages, asbolute and relative paths
  final String _root;

  Output build(MetaObject<Data, Output> object, Data input) {
    return object
        .build(BuildContext(input: input, root: _root + (object.root ?? '')));
  }
}

abstract class MetaObject<I, O> {
  MetaObject({
    this.root,
  });

  final String? root;

  O build(BuildContext<I, O> context);
}

class StreamViewBlocData {
  StreamViewBlocData({
    required this.subject,
    required this.stateFields,
  });

  final String subject;
  final Map<String, dynamic> stateFields;
}

class StreamViewBloc extends MetaObject<StreamViewBlocData, void> {
  StreamViewBloc({
    super.root,
    required this.model,
  });

  final Model model;

  @override
  void build(BuildContext context) {
    context.build(
        model,
        ModelData(
          context.input.subject,
          context.input.stateFields,
        ));
  }
}

class ModelData {
  ModelData(
    this.name,
    this.type,
  );
  final String name;
  final Map<String, dynamic> type;
}

class Model extends MetaObject<ModelData, void> {
  Model({super.root});

  @override
  void build(BuildContext context) {
    throw UnimplementedError();
  }
}

class ListViewData {
  ListViewData({
    required this.subject,
  });

  final String subject;
}

class ListView extends MetaObject<ListViewData, void> {
  ListView({
    super.root,
    required this.bloc,
  });

  final StreamViewBloc bloc;

  @override
  void build(BuildContext context) {
    context.build(
      bloc,
      StreamViewBlocData(
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
    PageData(
      body: {
        ListView(
          bloc: StreamViewBloc(
            model: Model(),
          ),
        ): ListViewData(
          subject: 'test',
        )
      },
    ),
  );

  buildObject(
    StreamViewBloc(
      model: Model(),
    ),
    StreamViewBlocData(
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