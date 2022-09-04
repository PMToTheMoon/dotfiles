import 'dart:mirrors';

void test() {
  print("hello mirros");
}

void main() {
  final t = reflect(test);
  if (t is ClosureMirror) {
    final location = t.function.location!;
    final uri = location.sourceUri;
    print(t.function.source);
  }
}
