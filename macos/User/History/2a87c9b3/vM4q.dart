import 'package:common/common.dart';
import 'package:common/src/widgets/layouts/unfoldable_list.dart';
import 'package:flutter/material.dart';

List<Widget> unfoldables(BuildContext context) => [
      DefaultUnfoldableListController(
        unfoldedItemLimit: 1,
        child: Material(
          type: MaterialType.canvas,
          child: Column(
            children: [
              const SpaceSmall(),
              UnfoldableListItem(
                builder: (context, unfolded) => _Card(
                  unfolded: unfolded,
                ),
              ),
              const SpaceSmall(),
              UnfoldableListItem(
                builder: (context, unfolded) => _Card(
                  unfolded: unfolded,
                ),
              ),
              const SpaceSmall(),
              UnfoldableListItem(
                builder: (context, unfolded) => _Card(
                  unfolded: unfolded,
                ),
              ),
              const SpaceSmall(),
              UnfoldableListItem(
                builder: (context, unfolded) => _Card(
                  unfolded: unfolded,
                ),
              ),
            ],
          ),
        ),
      )
    ];

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.unfolded,
  }) : super(key: key);

  final bool unfolded;

  @override
  Widget build(BuildContext context) {
    return TbtHoverCard(
      onTap: () {
        Actions.invoke(context, const UnfoldUnfoldableItem());
      },
      child: Unfoldable(
        extension: unfolded,
        header: const Fold(),
        ext: const Unfold(),
      ),
    );
  }
}

class Fold extends StatelessWidget {
  const Fold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmall(),
      child: Column(
        children: const [
          Text('folded'),
        ],
      ),
    );
  }
}

class Unfold extends StatelessWidget {
  const Unfold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmall(),
      child: Column(
        children: const [
          Text('folded'),
          Text('folded'),
          Text('folded'),
          Text('folded'),
          Text('folded'),
          Text('folded'),
          Text('folded'),
        ],
      ),
    );
  }
}
