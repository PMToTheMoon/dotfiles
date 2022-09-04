# json serializable

It might be cool to access other generated field and use them as reference.

```dart
final parent =  
JsonSerializable(
  'Parent',
  {
    jsonField(
      'child',
      refer('Child', 'package:models/models.dart'),
    ),
  }
);
```