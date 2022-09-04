Sub-classes does not inherit from duper class constructor.

You can still use super parameters, but its doesn't totally solve the problem.

```dart
abstract class Super {
  Super();
  Super.named1();
  Super.named2();
  ...
} 

class Implementer1 {
  Implementer1();
  Implementer1.named1() : super.named1();
  Implementer1.named2() : super.named2();
  ...
} 

class Implementer2 {
  Implementer2();
  Implementer2.named1() : super.named1();
  Implementer2.named2() : super.named2();
  ...
} 
```