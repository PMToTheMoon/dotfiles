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

  String emit(Spec spec);

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
    return PartBuildStep(this);
  }
}

class BuildStepImpl implements BuildStep {
  BuildStepImpl({
    required this.path,
    required this.writer,
  }) : allocator = BuildStepAllocator(path);

  final BuildStepAllocator allocator;

  @override
  DartEmitter get emitter => DartEmitter(allocator: allocator);

  @override
  String emit(Spec spec) {
    final content = spec.accept(emitter).toString();
    final formattedContent = formatter.format(content);
    writer.writeAsString(AssetId(path), formattedContent);
    return path;
  }
}

class PartBuildStep extends BuildStepImpl {
  PartBuildStep(BuildStep parent)
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
