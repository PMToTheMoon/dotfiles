class MyStateMachine extends StateMachine<Event, State> {
  MyStateMachine() : super(InitialState()) {
    define<RequestingAPI>(($) => $
      ..onEnter(_requestAPI)
      ..on<Success>(_toSuccess)
      ..on<Error>(_toError));

    define<Success>();
    define<Error>();
  }
}
