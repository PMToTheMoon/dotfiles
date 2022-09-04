import 'package:flutter/material.dart';

enum LoadedListStatus { loading, loaded, error }

class LoadedList<T> extends StatelessWidget {
  const LoadedList({
    required this.items,
    super.key,
  });

  final List<T> items;

  final LoadedListStatus status;
  final WidgetBuilder itemBuilder;
  final WidgetBuilder placeholderBuilder;
  final WidgetBuilder emptyBuilder;
  final WidgetBuilder errorBuilder;

  Widget _buildPlaceholderList() {}

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadedListStatus.error:
        return errorBuilder(context);
      case LoadedListStatus.loading:
        return _buildList();
    }
  }
}
