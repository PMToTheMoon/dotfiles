# BonemealConfig

The key for a Builder will be normalized so that consumers of the builder can refer to it in '$definingPackageName:$builderName' format. If the builder name matches the package name it can also be referred to with just the package name.

Exposed Builders are configured in the builders section of the build.yaml. This is a map of builder names to configuration. Each builder config may contain the following keys:

  * **import**: Required. The import uri that should be used to import the library containing the Builder class. This should always be a package: uri.
  
  * **builder_factories**: A List<String> which contains the names of the top-level methods in the imported library which are a function fitting the typedef Builder factoryName(BuilderOptions options).

  * **defaults**: Optional: Default values to apply when a user does not specify the corresponding key in their builders section. May contain the following keys:

    * **options**: Arbitrary yaml map, provided as the config map in BuilderOptions to the BuilderFactory for this builder. Individual keys will be overridden by configuration provided in either dev_options or release_options based on the build mode, and then overridden by any user specified configuration.
    dev_options: Arbitrary yaml map. Values will replace the defaults from options when the build is done in dev mode (the default mode).
    release_options: Arbitrary yaml map. Values will replace the defaults from options when the build is done in release mode (with --release).



_bonemeal.yaml_
```yaml
# generator definitions
generators:
  model_generator:
    import: "package:my_package/builder.dart"
    builder_factories: 
      - modelGenerator
    input_extensions: 
      - .dart
    default:
      options:
        some_key: some_value
```