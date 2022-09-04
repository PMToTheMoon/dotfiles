import 'dart:mirrors';

void test() {
  print("hello mirros");
}

void main() {
  final t = reflect(test);
  if (t is ClosureMirror) {
    final location = t.function.location!;
    print(.sourceUri);
  }
}
