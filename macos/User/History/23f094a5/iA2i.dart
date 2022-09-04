import 'package:test/test.dart';

abstract class Event {}

class EventA extends Event {}

class TriggerStateOnChange extends Event {}

abstract class State {
  @override
  bool operator ==(Object value) => false;

  @override
  int get hashCode => 0;
}

class StateA extends State {}

class StateB extends State {}

void main() {
  group("event receiving computing tests", body)
}
