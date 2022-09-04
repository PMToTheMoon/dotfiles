import 'package:flutter/material.dart';

enum LoadedListStatus { loading, loaded, error }

class LoadedList<T> extends StatelessWidget {
  const LoadedList({
    required this.items,
    required this.errorBuilder,
    required this.emptyBuilder,
    required this.placeholderBuilder,
    super.key,
  });

  final List<T> items;
  final int placeholderNumber;
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
        return _buildPlaceholderList();
    }
  }
}
