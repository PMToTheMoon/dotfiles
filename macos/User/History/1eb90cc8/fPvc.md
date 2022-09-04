import 'package:researches/test2.dart';

import 'dart:mirrors';

void main() {
  final t = reflect(test);
  if (t is ClosureMirror) {
    final location = t.function.location!;
    final uri = location.sourceUri;
    print(t.function.source);
  }
}
