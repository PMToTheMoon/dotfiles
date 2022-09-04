import 'package:flutter/material.dart';

enum LoadedListStatus { loading, loaded, error }

class LoadedList<T> extends StatelessWidget {
  const LoadedList({
    super.key,
  });

  final LoadedListStatus status;
  final WidgetBuilder itemBuilder;
  final WidgetBuilder emptyBuilder;
  final WidgetBuilder errorBuilder;

  @override
  Widget build(BuildContext context) {
    return const Text('LoadedList');
  }
}
