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

  Map<String, dynamic> toParams(DartEmitter emitter) {
    return {
      'states': states.types.map((ctr, className) => MapEntry(ctr, {
            'class': className,
            'new': states.union.invoke(ctr).accept(emitter).toString(),
          })),
      'events': events.types.map((ctr, className) => MapEntry(ctr, {
            'class': className,
            'new': events.union.invoke(ctr).accept(emitter).toString(),
          })),
    };
  }
}
