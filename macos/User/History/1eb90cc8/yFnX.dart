import 'dart:mirrors';

void test() {
  print("hello mirros");
}

void main() {
  print(reflect(test).toString());
}
