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

class FetchBlocListView extends MetaObject {
  final FetchBloc fetchBloc;

  void build() {
    fetchBloc.import;
    fetchBloc.
  }
}
