The type generator take a map as input and output the corresponding data class.

input
```yaml
modelName:
  fieldA: fieldAType
  fieldB: fieldBType
  ...
```

The Type generator doesn't check if field's type exist. It can be anything as long it's valid dart type.