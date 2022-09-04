import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:test/test.dart';

import 'utils.dart';

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
  DummyStateMachine([State? initial]) : super(initial ?? StateA()) {
    define<StateA>(($) => $
      ..on((EventA e, s) {
        _onEvent(e);
        return StateB();
      })
      ..on((EventA e, s) {
        _onEvent(e);
        return StateB();
      }));
    define<StateB>(($) => $
      ..on((EventB e, s) {
        _onEvent(e);
        return null;
      })
      ..on((EventB e, s) {
        _onEvent(e);
        return StateA();
      }));
  }

  void _onEvent(dynamic e) => eventsReceived.add(e.runtimeType.toString());
  List<String> eventsReceived = [];
}

void main() {
  group("event receiving computing tests", () {
    test("events are evaluated sequentially until a transition happen",
        () async {
      final sm = DummyStateMachine();
      sm.add(EventA());
      sm.add(EventA());

      await wait();

      expect(sm.eventsReceived, ["EventA"]);

      sm.add(EventB());

      await wait();

      expect(sm.eventsReceived, []);
    });
    test(
        "if no event handeler corresponding to the received event is registered for the current state, event is ignored",
        () async {
      final sm = DummyStateMachine();
      sm.add(EventB());

      await wait();

      expect(sm.eventsReceived, []);
    });
  });
}
