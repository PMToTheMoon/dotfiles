import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/asset/asset_id.dart';
import 'package:bonemeal_core/src/asset/asset_writer.dart';
import 'package:bonemeal_core/src/meta_object/directive_allocator.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

export 'emitter.dart';
export 'formatter.dart';

abstract class BuildStep {
  BuildStep({
    required this.path,
    required this.writer,
  });

  final String path;
  final SyncAssetWriter writer;

  DartEmitter get emitter;

  @protected
  Allocator get allocator;

  String emit(Spec spec) {
    final emitter = defaultEmitter(allocator);
    final content = spec.accept(emitter).toString();
    final formattedContent = formatter.format(content);
    writer.writeAsString(AssetId(path), formattedContent);
    return path;
  }

  T build<T>(MetaObject<T> object) {
    final childStep = _childStep(object.path);
    return object.resolve(childStep);
  }

  BuildStep _childStep(String objectPath) {
    return BuildStepImpl(
      path: p.join(path, objectPath),
      writer: writer,
    );
  }

  T buildPart<T>(MetaObject<T> object);
}

class BuildStepImpl extends BuildStep {
  BuildStepImpl({
    required super.path,
    required super.writer,
  }) : allocator = BuildStepAllocator(path);

  @override
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
    final partPath = p.join(p.dirname(path), objectPath);
    return PartBuildStep(
      this,
      partPath,
    );
  }
}

class PartBuildStep extends BuildStep {
  PartBuildStep(BuildStepImpl parent, String path)
      : allocator = PartOfAllocator(parent.path, path, parent.allocator),
        super(
          path: path,
          writer: parent.writer,
        );

  @override
  final PartOfAllocator allocator;

  @override
  T buildPart<T>(MetaObject<T> object) =>
      throw "Creating part from a part build step ins't allowed";
}
