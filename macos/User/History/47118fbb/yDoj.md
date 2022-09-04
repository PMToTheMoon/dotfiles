Docs
* [ ] explain how to create union-like type for state and event
  * [ ] basic
  - [ ] when to use state machine bloc
  - [ ] how to name states/event
  * [ ] freezed / equatable
* [ ] good practices
  - [ ] states 
    - [ ] share data between states using bloc state machine constructor params
    - [ ] share data between states using inheritance
    - [ ] define common behavior for states
      - [ ] use mixin to create common class ??
  - [ ] transitions
    - [ ] share transition between states
    - [ ] transition that choose next state based on condition
  - [ ] common pattern

Code
* [X] ensure event are processed in sequential order
* [X] reset on event transformer to "sequential" instead of "droppable"
  - [X] better define rule for event transormations
* [X] make transition sync
* [ ] make event transformer available in ctr
* [ ] polish errors

Tests
* [ ] nested states lifecicles


