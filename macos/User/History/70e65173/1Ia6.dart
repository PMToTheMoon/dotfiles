part of 'to_import.dart';

class Registrant {
  Registrant(Type t, String value) {
    registry[t] = value;
  }
}

final test1 = Registrant(String, "String");
final test2 = Registrant(double, "Double");
