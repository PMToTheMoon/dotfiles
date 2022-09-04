import 'package:common/common.dart';
import 'package:flutter/material.dart';

class _Item extends StatelessWidget {
  const _Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 89,
    );
  }
}

List<Widget> lists(BuildContext context) => [
      const TbtHoverCard(
        child: Padding(
          padding: PaddingSmall.horizontal(),
          child: SizedBox(
            height: 500,
            child: LoadedList(
              spacing: SpaceSmall(),
              children: [
                _Item(),
                _Item(),
                _Item(),
                _Item(),
                _Item(),
                _Item(),
              ],
            ),
          ),
        ),
      ),
    ];
