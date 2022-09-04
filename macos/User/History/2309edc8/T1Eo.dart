import 'package:bloc/bloc.dart';

// metasource, metaobject, seed, meta

abstract class MetaObject {
  Future<void> write();
}

class Seeds implements MetaObject {
  Seeds(this.children);

  final List<MetaObject> children;

  Future<void> write() async {
    for (final child in children) {
      await child.write();
    }
  }
}

class ComposedMetaObject implements MetaObject {
  Future<void> write() async {
    final object = build(BuildContext context);
    await object.write();

  }

  MetaObject build(BuildContext context);
}

class FetchBlocListView extends ComposedMetaObject {
  final String subject;
  final DataSource source;

  MetaObject build() {

    final bloc = FetchBloc(
        suject: 'Bloc',
        source: source,
      );

    bloc.useFunctions();

    return Seeds([
      bloc,
      listView,
    ]);
  }
}

class MultiChildMetaObject extends MetaObject {
  final Iterable<MetaObject> children;

  MultiChildMetaObject(this.children);

  void write() {
    for (final child in children) {
      // create child context
      child.build(childContext);
    }
  }
}

final l = FetchBlocListView(
  subjet: 'MyList',
  source: Source,
  widget: builder,
  spacing: buidler,
);

final b = FetchBloc(
  suject: 'Bloc',
  source: source,
);

class Model extends MetaObject {
  void write() {}
}
