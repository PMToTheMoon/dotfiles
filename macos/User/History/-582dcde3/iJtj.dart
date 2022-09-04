import 'package:isolate_test/isolate_test.dart' as isolate_test;

final script = """
void main(List<String> args) {
  print("hello world");
}
""";

void main(List<String> arguments) {
  print('Hello world: ${isolate_test.calculate()}!');
}
