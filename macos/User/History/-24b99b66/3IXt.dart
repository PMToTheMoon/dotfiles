import 'package:bonemeal/bonemeal.dart';

export 'hook_annotation.dart';

class Hook {
  const Hook({
    required this.code,
    required this.inline,
  });

  final bool inline;
  final Code inline;
  final Code code;
}
