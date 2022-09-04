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
}
