import 'package:bonemeal_core/src/generator/generator.dart';
import 'package:bonemeal_core/src/environment/build_environment.dart';
import 'package:bonemeal_core/src/asset_graph/asset_graph.dart';
import 'package:bonemeal_core/src/package_graph/package_graph.dart';

class BuildDefinition {
  final AssetGraph assetGraph;
  final TargetGraph targetGraph;

  final PackageGraph packageGraph;

  static Future<BuildDefinition> prepareWorkspace(
    BuildEnvironment environment,
    GeneratorOptions options,
  ) {}
}

class _Loader {
  /// Attempts to read in an [AssetGraph] from disk, and returns `null` if it
  /// fails for any reason.
  Future<AssetGraph?> _tryReadCachedAssetGraph() async {
    final assetGraphId =
        AssetId(_options.packageGraph.root.name, assetGraphPath);
    if (!await _environment.reader.canRead(assetGraphId)) {
      return null;
    }

    return logTimedAsync(_logger, 'Reading cached asset graph', () async {
      try {
        var cachedGraph = AssetGraph.deserialize(
            await _environment.reader.readAsBytes(assetGraphId));
        var buildPhasesChanged = computeBuildPhasesDigest(_buildPhases) !=
            cachedGraph.buildPhasesDigest;
        var pkgVersionsChanged = !const DeepCollectionEquality()
            .equals(cachedGraph.packageLanguageVersions, {
          for (var pkg in _options.packageGraph.allPackages.values)
            pkg.name: pkg.languageVersion
        });
        var enabledExperimentsChanged =
            !const DeepCollectionEquality.unordered()
                .equals(cachedGraph.enabledExperiments, enabledExperiments);
        if (buildPhasesChanged ||
            pkgVersionsChanged ||
            enabledExperimentsChanged) {
          if (buildPhasesChanged) {
            _logger.warning(
                'Throwing away cached asset graph because the build phases have '
                'changed. This most commonly would happen as a result of adding a '
                'new dependency or updating your dependencies.');
          }
          if (pkgVersionsChanged) {
            _logger.warning(
                'Throwing away cached asset graph because the language '
                'version of some package(s) changed. This would most commonly '
                'happen when updating dependencies or changing your min sdk '
                'constraint.');
          }
          if (enabledExperimentsChanged) {
            _logger.warning(
                'Throwing away cached asset graph because the enabled Dart '
                'language experiments changed:\n\n'
                'Previous value: ${cachedGraph.enabledExperiments.join(' ')}\n'
                'Current value: ${enabledExperiments.join(' ')}');
          }
          await Future.wait([
            _deleteAssetGraph(_options.packageGraph),
            _cleanupOldOutputs(cachedGraph),
            FailureReporter.cleanErrorCache(),
          ]);
          if (_runningFromSnapshot) {
            throw BuildScriptChangedException();
          }
          return null;
        }
        if (!isSameSdkVersion(cachedGraph.dartVersion, Platform.version)) {
          _logger.warning(
              'Throwing away cached asset graph due to Dart SDK update.');
          await Future.wait([
            _deleteAssetGraph(_options.packageGraph),
            _cleanupOldOutputs(cachedGraph),
            FailureReporter.cleanErrorCache(),
          ]);
          if (_runningFromSnapshot) {
            throw BuildScriptChangedException();
          }
          return null;
        }
        return cachedGraph;
      } on AssetGraphCorruptedException catch (_) {
        // Start fresh if the cached asset_graph cannot be deserialized
        _logger.warning('Throwing away cached asset graph due to '
            'version mismatch or corrupted asset graph.');
        await Future.wait([
          _deleteGeneratedDir(),
          FailureReporter.cleanErrorCache(),
        ]);
        return null;
      }
    });
  }
}
