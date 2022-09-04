import 'package:common/common.dart';
import 'package:common/src/widgets/layouts/unfoldable_list.dart';
import 'package:flutter/material.dart';

final _unfold = Container(
  height: 89,
  color: Colors.amber,
  child: const Center(
    child: Text("unfold"),
  ),
);

List<Widget> unfoldables(BuildContext context) => [
      DefaultUnfoldableListController(
        unfoldedItemLimit: 1,
        child: Column(
          children: [
            // UnfoldableListItem(
            //   // containerBuilder: (c, child) => TbtHoverCard(
            //   //   onTap: () {
            //   //     print("tap");
            //   //     Actions.invoke(c, const UnfoldUnfoldableItem());
            //   //   },
            //   //   child: child,
            //   // ),
            //   fold: _fold,
            //   unfold: _unfold,
            // ),
            // const SpaceSmall(),
            // UnfoldableListItem(
            //   fold: Fold(),
            //   unfold: Unfold(),
            // ),
            // const SpaceSmall(),
            // UnfoldableListItem(
            //   fold: _fold,
            //   unfold: _unfold,
            // ),
            const SpaceSmall(),
            UnfoldableListItem(
              builder: (context, unfolded) => Unfoldable(
                unfold: unfolded,
                folded: const Fold(),
                unfolded: const Unfold(),
              ),
            ),
          ],
        ),
      )
    ];

class Fold extends StatelessWidget {
  const Fold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TbtHoverCard(
      onTap: () {
        Actions.invoke(context, const UnfoldUnfoldableItem());
      },
      child: Container(
        height: 54,
        child: const Center(
          child: Text('folded'),
        ),
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
    return TbtHoverCard(
      onTap: () {
        Actions.invoke(context, const FoldUnfoldableItem());
      },
      child: _unfold,
    );
  }
}
