import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/src/generate/phase.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:logging/logging.dart';

typedef PackageFilter = bool Function(PackageNode node);

/// Run a builder on all packages in the package graph.
PackageFilter toAllPackages() => (_) => true;

/// Require manual configuration to opt in to a builder.
PackageFilter toNoneByDefault() => (_) => false;

/// Run a builder on all packages with an immediate dependency on [packageName].
PackageFilter toDependentsOf(String packageName) =>
    (p) => p.dependencies.any((d) => d.name == packageName);

/// Run a builder on a single package.
PackageFilter toPackage(String package) => (p) => p.name == package;

/// Run a builder on a collection of packages.
PackageFilter toPackages(Set<String> packages) =>
    (p) => packages.contains(p.name);

/// Run a builders if the package matches any of [filters]
PackageFilter toAll(Iterable<PackageFilter> filters) =>
    (p) => filters.any((f) => f(p));

PackageFilter toRoot() => (p) => p.isRoot;


typedef BuildPhaseFactory = BuildPhase Function(
  PackageNode package,
  GeneratorOptions options,
  bool isReleaseBuild,
);

/// A description of which packages need a given [Builder] or
/// [PostProcessBuilder] applied.
class GeneratorApplication {
  /// Factories that create [BuildPhase]s for all [Builder]s or
  /// [PostProcessBuilder]s that should be applied.
  final List<BuildPhaseFactory> buildPhaseFactories;

  /// Determines whether a given package needs builder applied.
  final PackageFilter filter;

  /// A uniqe key for this builder.
  ///
  /// Ignored when null or empty.
  final String builderKey;

  const GeneratorApplication._(
    this.builderKey,
    this.buildPhaseFactories,
    this.filter,
  );

  factory GeneratorApplication.forBuilder(
    String builderKey,
    List<GeneratorFactory> builderFactories,
    PackageFilter filter, {
    bool isOptional = false,
    bool hideOutput = true,
    GeneratorOptions defaultOptions = GeneratorOptions.empty,
    GeneratorOptions? defaultDevOptions,
    GeneratorOptions? defaultReleaseOptions,
    Iterable<String> appliesBuilders = const [],
  }) {
    var phaseFactories = builderFactories.map((builderFactory) {
      return (PackageNode package, GeneratorOptions options,
           bool isReleaseBuild) {
        

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
        _validateBuilder(builder);
        return InBuildPhase(builder, package.name,
            builderKey: builderKey,
            targetSources: targetSources,
            generateFor: generateFor,
            builderOptions: optionsWithDefaults,
            hideOutput: hideOutput,
            isOptional: isOptional);
      };
    }).toList();
    return GeneratorApplication._(
        builderKey, phaseFactories, filter, hideOutput, appliesBuilders);
  }