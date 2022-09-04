import 'dart:mirrors';

void test() {
  print("hello mirros");
}

void main() {
  final t = reflect(test);
  if (t is DeclarationMirror) {

  print(.s);
  }
}
