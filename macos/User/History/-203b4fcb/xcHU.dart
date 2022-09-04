import 'package:bonemeal_gen/bonemeal_gen.dart';
import 'package:bonemeal_gen/src/mirror_builder/mirror_builder.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

export 'src/hook_builder/hook_builder.dart';
export 'src/transformer_builder/transformer_builder.dart';

Builder bonemealGenBuilder(BuilderOptions options) => PartBuilder(
      [
        HookBuilder(),
        TransformerBuilder(),
      ],
      '.bonemeal.dart',
    );

Builder mirrorBuilder(BuilderOptions options) => LibraryBuilder(
      MirrorBuilder(),
      generatedExtension: '.mirror.dart',
    );
