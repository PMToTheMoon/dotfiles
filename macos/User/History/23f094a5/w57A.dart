import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:test/test.dart';

abstract class Event {}

class EventA extends Event {}

class EventB extends Event {}

class TriggerStateOnChange extends Event {}

abstract class State {
  @override
  bool operator ==(Object value) => false;

  @override
  int get hashCode => 0;
}

class StateA extends State {}

class StateB extends State {}

class DummyStateMachine extends StateMachine<Event, State> {
  DummyStateMachine(
    State? initial,
  ) : super(initial ?? StateA()) {
    define<StateA>(($) => $
      ..on((EventA e, s) {
        _onEvent(e);
        return StateB();
      }));
    define<StateB>(($) => $
      ..on((EventA e, s) {
        _onEvent(e);
        return StateA();
      }));
  }

  void _onEvent(dynamic e) => eventsReceived.add(e.runtimeType.toString());
  List<String> eventsReceived = [];
}

void main() {
  group("event receiving computing tests", () {
    test("events are evaluated sequentially", body);
    test(
      "if no event handeler corresponding to the received event is registered for the current state, event is ignored",
    );
  });
}
