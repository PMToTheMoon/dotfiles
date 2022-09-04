# Type Generator

The type generator take a map as input and output the corresponding data class.

input
```yaml
modelName:
  fieldA: int
  fieldB: String
  ...
```

The Type generator doesn't check if field's type exist. It can be anything as long it's valid dart type. This mean that you can also use custom type for field, but you must be sure that  output file contain correct dependencies.

input
```yaml
modelName:
  fieldA: MyCustomClass
```

