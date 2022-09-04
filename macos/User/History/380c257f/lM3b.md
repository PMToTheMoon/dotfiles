Sub-classes does not inherit from duper class constructor.


```dart
abstract class Super {
  Super();
  Super.named1();
  Super.named2();
  
  void action();
} 

class Implementer1 {
  Implementer1();
  Implementer1.named1() : super.named1();
  Implementer1.named2() : super.named2();

  @override
  void action() {}
} 

class Implementer2 {
  Implementer2();
  Implementer2.named1() : super.named1();
  Implementer2.named2() : super.named2();
  
  @override
  void action() {}
} 
```
You can still use super parameters, but its doesn't solve the problem.
It doesn't scale.

solution:
```dart
abstract class Super {
  Super();
  Super.named1();
  Super.named2();
  
  void action();
} 

class Implementer1 = Super with _Action1;

class _Action1 {
  void action() {}
}

class Implementer2 = Super with _Action2;

class _Action2 {
  void action() {}
}
```

As you can see, if you add a constructor to super class, it will be automticaly propagated to implementer.