import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/profile/educations/bloc/candidate_educations_bloc.dart';

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
  State<StatefulWidget> createState() => ImplicitlyAnimatedListState<T>();
}

class ImplicitlyAnimatedListState<T> extends State<ImplicitlyAnimatedList<T>> {
  late List<T> _effectiveItems = widget.items;

  final _animatedList = GlobalKey<AnimatedListState>();

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);

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

class CandidateEducationsListView extends StatelessWidget {
  const CandidateEducationsListView({
    super.key,
  });

  Widget educationBuilder(BuildContext context, Education education, Animation<double> animation) {
    return UnclippedSizeTransition(
          sizeFactor: animation,
          child: UnfoldableEducationCard(
            key: ValueKey(item.id),
            education: item,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((CandidateEducationsBloc bloc) => bloc.state);
    if (state.isLoading) return const LoadingIndicator();
    return DefaultUnfoldableListController(
      child: ImplicitlyAnimatedList<Education>(
        clipBehavior: Clip.none,
        shrinkWrap: true,
        items: state.educations,
        insertBuilder: (context, item, animation) => ,
        removeBuilder: (context, item, animation) => UnclippedSizeTransition(
          sizeFactor: animation,
          child: UnfoldableEducationCard(
            key: ValueKey(item.id),
            education: item,
          ),
        ),
      ),
    );
  }
}
