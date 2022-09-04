BonemealConfig

The key for a Builder will be normalized so that consumers of the builder can refer to it in '$definingPackageName:$builderName' format. If the builder name matches the package name it can also be referred to with just the package name.

Exposed Builders are configured in the builders section of the build.yaml. This is a map of builder names to configuration. Each builder config may contain the following keys:

    import: Required. The import uri that should be used to import the library containing the Builder class. This should always be a package: uri.
    builder_factories: A List<String> which contains the names of the top-level methods in the imported library which are a function fitting the typedef Builder factoryName(BuilderOptions options).

_bonemeal.yaml_
```yaml
generators:
  model_generator:
    import: "package:my_package/builder.dart"
    builder_factories: 
      - modelGenerator
    input_extensions: 
      - .dart

```