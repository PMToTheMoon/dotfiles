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
        'states': states.types.map((ctr, className) => MapEntry(ctr, {
              'class': className,
              'new': states.union.invoke(ctr),
            })),
        'events': events.types.map((k, $class) => MapEntry(k, {
              'class': $class.name,
              'new': $class.invoke(),
            })),
      };
}
