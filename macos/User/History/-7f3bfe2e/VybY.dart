import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';
import 'package:output/my_model.dart' as out;

part 'model.bm.dart';

class MyModel extends Seed {
  @override
  MetaObject grow() {
    return MultiPart(main: Fragment(path, library), parts: [
      Model(
        className: 'MyModel',
        fields: {},
        hooks: myModelHooks,
      ),
    ]);
    return Model(
      className: 'MyModel',
      fields: {},
      hooks: myModelHooks,
    );
  }
}

@ToHook()
extension MyModelHooks on out.MyModel {
  void displayFr() {
    print("yesya");
  }

  void test2() => print("yesya");

  String get test => ":)";

  set setter(String a) => print(a);
}
