part of 'bloc.dart';

class BlocMetaData {
  const BlocMetaData({
    required this.fields,
    required this.states,
    required this.events,
  });

  final Fields fields;
  final UnionMetaData states;
  final UnionMetaData events;

  Map<String, dynamic> toParams() => {
        'states': states.types.map((k, $class) => MapEntry(k, {
              'class': $class.name,
              'new': $class.invoke(),
            })),
        'events': events.types.map((k, $class) => MapEntry(k, {
              'class': $class.name,
              'new':
                  '${events.className}.${v.name}${v.fields.toFunctionCallParameters()}',
            })),
      };
}
