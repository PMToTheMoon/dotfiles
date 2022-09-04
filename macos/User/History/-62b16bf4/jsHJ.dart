import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_core/src/asset/asset_id.dart';
import 'package:bonemeal_core/src/asset/asset_writer.dart';
import 'package:bonemeal_core/src/meta_object/directive_allocator.dart';
import 'package:bonemeal_core/src/meta_object/emitter.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

import 'formatter.dart';

abstract class BuildStep {
  BuildStep({
    required this.path,
    required this.writer,
  });

  final String path;
  final SyncAssetWriter writer;

  @protected
  DartEmitter get emitter;

  String emit(Spec spec) {
    final content = spec.accept(emitter).toString();
    final formattedContent = formatter.format(content);
    writer.writeAsString(AssetId(path), formattedContent);
    return path;
  }

  T build<T>(MetaObject<T> object) {
    final childStep = _childStep(object.path);
    return object.resolve(childStep);
  }

  T buildPart<T>(MetaObject<T> object) {
    final childStep = _partStep(object.path);
    return object.resolve(childStep);
  }

  BuildStep _childStep(String objectPath) {
    return BuildStepImpl(
      path: p.join(path, objectPath),
      writer: writer,
    );
  }

  BuildStep _partStep(String objectPath) {
    final partPath = p.join(p.dirname(path), objectPath);
    final partAllocator = PartOfAllocator(path, partPath, allocator);
    return BuildStep._(
      path: partPath,
      writer: writer,
      allocator: partAllocator,
    );
  }
}

class BuildStepImpl extends BuildStep {
  BuildStepImpl({
    required super.path,
    required super.writer,
  }) : allocator = BuildStepAllocator(path);

  final BuildStepAllocator allocator;

  @override
  DartEmitter get emitter => DartEmitter(allocator: allocator);
}

class PartBuildStep extends BuildStep {
  PartBuildStep(BuildStepImpl parent)
      : super(
          path: parent.path,
          writer: parent.writer,
        );

  final PartOfAllocator allocator;

  @override
  DartEmitter get emitter => DartEmitter(allocator: allocator);

  @override
  T buildPart<T>(MetaObject<T> object) =>
      throw "Creating part from a part build step ins't allowed";
}
