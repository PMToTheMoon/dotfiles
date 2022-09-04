import 'package:flutter/material.dart';

import 'list.dart';

class AnimatedLoadedList<T> extends StatelessWidget {
  const AnimatedLoadedList({
    required this.status,
    required this.items,
    required this.itemBuilder,
    required this.placeholderBuilder,
    required this.separatorBuilder,
    required this.errorBuilder,
    required this.emptyBuilder,
    this.placeholderNumber = 4,
    super.key,
  });

  final List<T> items;
  final int placeholderNumber;
  final LoadedListStatus status;
  final Widget Function(BuildContext, int index, T item) itemBuilder;
  final IndexedWidgetBuilder placeholderBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final WidgetBuilder emptyBuilder;
  final WidgetBuilder errorBuilder;

  Widget _buildPlaceholderList() {
    return ListView.separated(
      itemCount: placeholderNumber,
      itemBuilder: placeholderBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget _buildList(BuildContext context, {required bool loading}) {
    int count = placeholderNumber;
    var builder = placeholderBuilder;
    if (loading == false) {
      if (items.isEmpty) return emptyBuilder(context);
      count = items.length;
      builder = (context, index) => itemBuilder(
            context,
            index,
            items[index],
          );
    }
    return ListView.separated(
      itemCount: count,
      itemBuilder: builder,
      separatorBuilder: separatorBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (status == LoadedListStatus.error) return errorBuilder(context);

    return _buildList(
      context,
      loading: status == LoadedListStatus.loading,
    );
  }
}
