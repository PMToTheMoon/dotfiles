import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef InsertBuilder<T> = Function(
  BuildContext context,
  T item,
  Animation<double> animation,
);

typedef RemoveBuilder<T> = Function(
  BuildContext context,
  T item,
  Animation<double> animation,
);

const _kDuration = Duration(milliseconds: 300);

class ImplicitlyAnimatedList<T> extends StatefulWidget {
  const ImplicitlyAnimatedList({
    super.key,
    required this.items,
    required this.insertBuilder,
    required this.removeBuilder,
    Duration? insertDuration,
    Duration? removeDuration,
    Clip? clipBehavior,
    bool? shrinkWrap,
  })  : insertDuration = insertDuration ?? _kDuration,
        removeDuration = removeDuration ?? _kDuration,
        clipBehavior = clipBehavior ?? Clip.hardEdge,
        shrinkWrap = shrinkWrap ?? false;

  final List<T> items;
  final InsertBuilder<T> insertBuilder;
  final RemoveBuilder<T> removeBuilder;
  final Duration insertDuration;
  final Duration removeDuration;
  final Clip clipBehavior;
  final bool shrinkWrap;

  @override
  State<StatefulWidget> createState() => _ImplicitlyAnimatedListState<T>();
}

class _ImplicitlyAnimatedListState<T> extends State<ImplicitlyAnimatedList<T>> {
  late List<T> _effectiveItems = widget.items;

  final _animatedList = GlobalKey<AnimatedListState>();

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items.length != _effectiveItems.length) {
      final insertedIndexes = widget.items.mapIndexed((index, element) {
        if (_effectiveItems.contains(element)) return null;
        return index;
      }).whereNotNull();
      final removedIndexes = _effectiveItems.mapIndexed((index, element) {
        if (widget.items.contains(element)) return null;
        return index;
      }).whereNotNull();
      for (final i in insertedIndexes) {
        _animatedList.currentState?.insertItem(i);
      }
      for (final r in removedIndexes) {
        final item = _effectiveItems[r];
        _animatedList.currentState?.removeItem(
          r,
          (context, animation) => widget.removeBuilder(
            context,
            item,
            animation,
          ),
          duration: widget.removeDuration,
        );
      }
    }
    _effectiveItems = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        clipBehavior: Clip.none,
        key: _animatedList,
        shrinkWrap: true,
        initialItemCount: _effectiveItems.length,
        itemBuilder: (context, index, animation) => widget.insertBuilder(
              context,
              _effectiveItems[index],
              animation,
            ));
  }
}
