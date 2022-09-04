import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/asset/asset_id.dart';
import 'package:bonemeal_core/src/asset/asset_writer.dart';
import 'package:bonemeal_core/src/meta_object/directive_allocator.dart';
import 'package:path/path.dart' as p;

import 'emitter.dart';
export 'formatter.dart';

abstract class BuildStep {
  BuildStep({
    required this.path,
    required this.writer,
    required this.outputPackage,
  });

  final String path;
  final SyncAssetWriter writer;
  final String outputPackage;

  DartEmitter get emitter;

  String emit(Spec spec) {
    final content = spec.accept(emitter).toString();
    final formattedContent = formatter.format(content);
    writer.writeAsString(AssetId(path), formattedContent);
    return path;
  }

  Iterable<T> buildAll<T>(Iterable<MetaObject<T>> objects) =>
      objects.map(build);

  T build<T>(covariant MetaObject<T> object) {
    final childStep = _childStep(object.path);
    return object.resolve(childStep);
  }

  String urlAsRelativePath(String url) {
    final dirname = p.dirname(path);
    if (p.isWithin(dirname, url)) {
      return p.relative(url, from: dirname);
    }
    return url;
  }

  BuildStep _childStep(String objectPath) {
    final pathIsDir = p.extension(path) == '';
    final childPath = pathIsDir
        ? p.join(path, objectPath)
        : p.join(p.dirname(path), objectPath);
    return BuildStepImpl(
      path: childPath,
      writer: writer,
      outputPackage: outputPackage,
    );
  }

  T buildPart<T>(MetaObject<T> object);
}

class BuildStepImpl extends BuildStep {
  BuildStepImpl({
    required super.path,
    required super.writer,
    required super.outputPackage,
  }) : allocator = BuildStepAllocator(path, outputPackage);

  final BuildStepAllocator allocator;

  @override
  late final DartEmitter emitter = defaultEmitter(allocator);

  @override
  T buildPart<T>(MetaObject<T> object) {
    final childStep = _partStep(object.path);
    return object.resolve(childStep);
  }

  BuildStep _partStep(String objectPath) {
    allocator.part(objectPath);
    final pathIsDir = p.extension(path) == '';
    final childPath = pathIsDir
        ? p.join(path, objectPath)
        : p.join(p.dirname(path), objectPath);
    return PartBuildStep(
      this,
      childPath,
    );
  }
}

class PartBuildStep extends BuildStep {
  PartBuildStep(BuildStepImpl parent, String path)
      : emitter = defaultEmitter(
          PartOfAllocator(parent.path, path, parent.allocator),
        ),
        super(
            path: path,
            writer: parent.writer,
            outputPackage: parent.outputPackage);

  @override
  final DartEmitter emitter;

  @override
  T buildPart<T>(MetaObject<T> object) =>
      throw "Creating part from a part build step ins't allowed";
}
