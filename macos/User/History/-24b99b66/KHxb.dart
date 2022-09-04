import 'package:bonemeal/bonemeal.dart';

class Hook {
  const Hook({
    Code? hook,
    List<Code>? hooks,
  }) : hooks = hooks ?? const [hook!];

  final List<Code> hooks;
}
