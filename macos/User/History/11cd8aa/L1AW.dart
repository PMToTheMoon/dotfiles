import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:model_generators/model_generators.dart';

void main() {
  build(
    Model(),
    const ModelData(
      type: "SuperModel",
      fields: {
        "name": "String",
        "age": "int",
      },
    ),
  );
}
