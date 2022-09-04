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
}
