import 'package:bonemeal_gen/bonemeal_gen.dart';

export 'src/hook_builder/hook_builder.dart';
export 'src/transformer_builder/transformer_builder.dart';

Builder bonemealGenBuilder(BuilderOptions options) => PartBuilder(
      [
        TransformerBuilder(),
      ],
      '.bm.dart',
    );
