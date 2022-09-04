import 'package:bonemeal/bonemeal.dart';

export '../annotations/hook_annotation.dart';

class Hook {
  const Hook({
    required this.declarations,
  });

  final Code? declarations;
}
