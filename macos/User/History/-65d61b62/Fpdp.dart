import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'education_card/unfoldable_education_card.dart';

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

class AnimatedDeltaList<T> extends StatefulWidget {
  const AnimatedDeltaList({
    super.key,
    required this.items,
    required this.insertBuilder,
    required this.removeBuilder,
    Duration? insertDuration,
    Duration? removeDuration,
  })  : insertDuration = insertDuration ?? _kDuration,
        removeDuration = removeDuration ?? _kDuration;

  final List<T> items;
  final InsertBuilder<T> insertBuilder;
  final RemoveBuilder<T> removeBuilder;
  final Duration insertDuration;
  final Duration removeDuration;

  @override
  State<StatefulWidget> createState() => AnimatedDeltaListState();
}

class AnimatedDeltaListState<T> extends State<AnimatedDeltaList<T>> {
  late List<T> _effectiveItems = widget.items;

  final _animatedList = GlobalKey<AnimatedListState>();

  @override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);

    if (widget.items.length != _effectiveItems.length) {
      final insertedIndexes = widget.items
          .whereNot((e) => _effectiveItems.contains(e))
          .mapIndexed((index, element) => index);
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

class CandidateEducationsListView extends StatefulWidget {
  const CandidateEducationsListView({
    super.key,
    required this.items,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  final List<Education> items;

  @override
  State<CandidateEducationsListView> createState() =>
      _CandidateEducationsListViewState();
}

class _CandidateEducationsListViewState
    extends State<CandidateEducationsListView> {
  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) return const LoadingIndicator();
    return DefaultUnfoldableListController(
      child: AnimatedList(
        clipBehavior: Clip.none,
        key: _animatedList,
        shrinkWrap: true,
        initialItemCount: _effectiveEducations.length,
        itemBuilder: (context, index, animation) => UnclippedSizeTransition(
          sizeFactor: animation,
          child: UnfoldableEducationCard(
            key: ValueKey(_effectiveEducations[index].id),
            education: _effectiveEducations[index],
          ),
        ),
      ),
    );
  }

  @override
  Widget removeItemBuilder(
    BuildContext context,
    Animation<double> animation,
    Education item,
  ) {
    return UnclippedSizeTransition(
      sizeFactor: animation,
      child: UnfoldableEducationCard(
        key: ValueKey(item.id),
        education: item,
      ),
    );
  }
}
