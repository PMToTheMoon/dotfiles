# Model Generator

The model generator take a map as input and output the corresponding data class.

input
```yaml
modelName:
  fieldA: int
  fieldB: String
  ...
```

The model generator doesn't check if field's type exist. It can be anything as long it's valid dart type. This mean that you can also use custom type for field, but you must be sure that  output file contain correct dependencies.

input
```yaml
modelName:
  fieldA: MyCustomClass
  fieldB: int?
```

## Case
The generator will always transform modelName into PascalCase. It does **not** change field names or types case.

## Required parameters and default values
Every fields are `required`by default. You chan change this behavior by adding "?" at the end of the field name.
You can specify default value by adding `= value` after the field type. It should be valid dart code.
```yaml
modelName:
  optionalField?: int # optional
  defaultValue: int = 1 # default value
```

## Nested models
If a model field isn't a string value but a map, the generator will consider this field as a nested model and will also generate the sub-model.
The sub-model class name will be based on the parent field name transformed in pascal case.

```yaml
ParentModel:
  nestedModel:
    nestedModelField: int
  parentFieldB: String
```
the input above will produce the following dart code:

```dart
class NestedModel {
  NestedModel({required this.nestedModelField});

  final int nestedModelField;
}

class ParentModel {
  Test({required this.nestedModel, required this.parentFieldB});

  final NestedModel nestedModel;
  final String parentFieldB;
}
```
