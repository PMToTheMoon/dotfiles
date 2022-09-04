import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'education_card/unfoldable_education_card.dart';

class AnimatedDeltaList<T> extends StatefulWidget {
  final List<T> items;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

mixin AnimatedListDiffState<T> on State<AnimatedListDiff<T>> {
  late List<T> _effectiveItems = widget.items;

  final _animatedList = GlobalKey<AnimatedListState>();

  Widget removeItemBuilder(
    BuildContext context,
    Animation<double> animation,
    T item,
  );

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
          (context, animation) => removeItemBuilder(
            context,
            animation,
            item,
          ),
        );
      }
    }
    _effectiveItems = widget.items;
  }
}

class CandidateEducationsListView extends StatefulWidget
    implements AnimatedListDiff<Education> {
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
    extends State<CandidateEducationsListView>
    with AnimatedListDiffState<Education> {
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
