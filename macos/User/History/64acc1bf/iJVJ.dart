import 'package:bonemeal/bonemeal.dart';

Generator buildGenerator(
  String generatorKey,
  List<BuilderFactory> builderFactories,
  PackageFilter filter, {
  bool isOptional = false,
  bool hideOutput = true,
  InputSet defaultGenerateFor = const InputSet(),
  GeneratorOptions defaultOptions = GeneratorOptions.empty,
  GeneratorOptions? defaultDevOptions,
  GeneratorOptions? defaultReleaseOptions,
  Iterable<String> appliesBuilders = const [],
}) {
  var phaseFactories = builderFactories.map((builderFactory) {
    return (PackageNode package, GeneratorOptions options,
        InputSet targetSources, InputSet? generateFor, bool isReleaseBuild) {
      generateFor ??= defaultGenerateFor;

      var optionsWithDefaults = defaultOptions
          .overrideWith(
              isReleaseBuild ? defaultReleaseOptions : defaultDevOptions)
          .overrideWith(options);
      if (package.isRoot) {
        optionsWithDefaults =
            optionsWithDefaults.overrideWith(GeneratorOptions.forRoot);
      }

      final logger = Logger(builderKey);
      final builder =
          _scopeLogSync(() => builderFactory(optionsWithDefaults), logger);
      if (builder == null) throw CannotBuildException();
      _validateGenerator(builder);
      return InBuildPhase(builder, package.name,
          builderKey: builderKey,
          targetSources: targetSources,
          generateFor: generateFor,
          builderOptions: optionsWithDefaults,
          hideOutput: hideOutput,
          isOptional: isOptional);
    };
  }).toList();
  return BuilderApplication._(
      builderKey, phaseFactories, filter, hideOutput, appliesBuilders);
}
