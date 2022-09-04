Sub-classes does not inherit from duper class constructor.

You can still use super parameters, but its doesn't totally solve the problem:

```dart
abstract class Super {
  Super();
  Super.named1();
  Super.named2();
  ...
} 
```