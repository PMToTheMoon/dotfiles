import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

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
  final Key? listKey;

  int itemIndex(int listIndex) {
    return listIndex * 2;
  }

  int get itemLength {
    int count = placeholderNumber;
    if (status != LoadedListStatus.loading) {
      count = items.length;
    }
    // separators
    return (count * 2) - 1;
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    // build separator
    if (index % 2 != 0) {
      return separatorBuilder(context, index);
    } else if (status == LoadedListStatus.loading) {
      return placeholderBuilder(context, index, animation);
    } else {
      return itemBuilder(
        context,
        index,
      );
    }
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

    return AnimatedList(
      key: listKey,
      itemCount: count,
      itemBuilder: _buildItem,
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
