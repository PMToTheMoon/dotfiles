part of 'to_import.dart';

class Registrant<T> {
  Registrant(String value) {
    registry[T] = value;
  }
}

final test1 = Registrant<String>("String");
final test2 = Registrant<double>("Double");
