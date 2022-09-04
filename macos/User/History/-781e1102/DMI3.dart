import 'package:common/common.dart';
import 'package:flutter/material.dart';

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 54,
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 54,
    );
  }
}

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
        child: SizedBox(
          height: 500,
          child: LoadedList(
            itemPadding: PaddingSmall.horizontal(),
            spacing: SpaceSmall(),
            header: _Header(),
            footer: _Footer(),
            separator: Divider(),
          ),
        ),
      ),
      const TbtHoverCard(
        child: SizedBox(
          height: 500,
          child: LoadedList(
            itemPadding: PaddingSmall.horizontal(),
            spacing: SpaceSmall(),
            header: _Header(),
            footer: _Footer(),
            separator: Divider(),
            children: [],
          ),
        ),
      ),
      const TbtHoverCard(
        child: SizedBox(
          height: 500,
          child: LoadedList(
            itemPadding: PaddingSmall.horizontal(),
            spacing: SpaceSmall(),
            header: _Header(),
            footer: _Footer(),
            separator: Divider(),
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
    ];
