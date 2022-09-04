import 'package:state_machine_bloc/state_machine_bloc.dart';
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

class DummyStateMachine extends StateMachine<Event, State> {
  DummyStateMachine(
    State? initial,
  ) : super(initial ?? StateA());

  List<String> onEnterCalls = [];
  List<String> onExitCalls = [];
  List<String> onChangeCalls = [];
}

void main() {
  group("event receiving computing tests", () {});
}
