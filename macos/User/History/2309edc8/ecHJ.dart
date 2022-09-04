// import 'package:bloc/bloc.dart';

// abstract class MetaObject {
//   Future<void> write();
// }

// class MultiChildMetaObject implements MetaObject {
//   MultiChildMetaObject(this.children);

//   final List<MetaObject> children;

//   Future<void> write() async {
//     for (final child in children) {
//       await child.write();
//     }
//   }
// }

// // class ComposedMetaObject implements MetaObject {
// //   Future<void> write() async {
// //     final object = build();
// //     await object.write();
// //   }

// //   MetaObject build(BuildContext context) {}
// // }

// class FetchBloc extends MultiChildMetaObject {
//   MetaObject build(BuildContext context) {

//   }
// }

import 'package:researches/b2/test.dart';

class FetchBlocListView extends MetaObject {
  final String subject;
  final DataSource source;

  MetaObject build() {
    return MultiChildMetaObject([
      FetchBloc(
        suject: 'Bloc',
        source: source,
      ),
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


FetchBlocListView(
  subjet: 'MyList',
  source: Source,
  widget: builder,
  spacing: buidler
);

FetchBloc(
  suject: 'Bloc',
  source: source,
);