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
      height: 12,
      width: 12,
    );
  }
}

List<Widget> lists => [
  SizedBox(
    height: 500,
    child: LoadedList(children: [

    ],),
  ),
];