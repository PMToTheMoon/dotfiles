part of 'to_import.dart';

class Registrant<T> {
  Registrant() {
    registry[T] = "Hey";
  }
}

final test = Registrant();
