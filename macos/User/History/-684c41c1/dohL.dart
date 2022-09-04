part of 'bloc.dart';

class BlocMetaData {
  const BlocMetaData({
    required this.parameters,
    required this.states,
    required this.events,
  });

  final Fields parameters;
  final UnionMetaData states;
  final UnionMetaData events;

  Map<String, dynamic> toParams() => {
        'states': states.types.map((k, v) => MapEntry(k, {
              'class': v.className,
              'new':
                  '${states.className}.${v.name}${v.fields.toFunctionCallParameters()}',
            })),
        'events': events.types.map((k, v) => MapEntry(k, {
              'class': v.className,
              'new':
                  '${events.className}.${v.name}${v.fields.toFunctionCallParameters()}',
            })),
      };
}