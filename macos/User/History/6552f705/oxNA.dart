import 'package:flutter/material.dart';

enum LoadedListStatus { loading, loaded, error }

class LoadedList<T> extends StatelessWidget {
  const LoadedList({
    this.listKey,
    required this.status,
    required this.items,
    required this.itemBuilder,
    required this.placeholderBuilder,
    required this.separatorBuilder,
    required this.errorBuilder,
    required this.emptyBuilder,
    this.placeholderNumber = 4,
    this.footer,
    super.key,
  });

  final Key? listKey;
  final List<T> items;
  final int placeholderNumber;
  final LoadedListStatus status;
  final Widget Function(BuildContext, int index, T item) itemBuilder;
  final IndexedWidgetBuilder placeholderBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final WidgetBuilder emptyBuilder;
  final WidgetBuilder errorBuilder;
  final Widget? footer;

  Widget _buildPlaceholderList() {
    return ListView.separated(
      key: listKey,
      itemCount: placeholderNumber,
      itemBuilder: placeholderBuilder,
      separatorBuilder: separatorBuilder,
    );
  }

  Widget _buildList(BuildContext context) {
    int itemCount = items.length
    if (footer != null) ++itemCount;
    if (items.isEmpty) return emptyBuilder(context);
    return ListView.separated(
      key: listKey,
      itemCount: items.length,
      itemBuilder: (context, index) => itemBuilder(
        context,
        index,
        items[index],
      ),
      separatorBuilder: separatorBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadedListStatus.error:
        return errorBuilder(context);
      case LoadedListStatus.loading:
        return _buildPlaceholderList();
      case LoadedListStatus.loaded:
        return _buildList(context);
    }
  }
}
