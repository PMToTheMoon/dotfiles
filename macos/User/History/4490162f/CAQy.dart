import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class PageShell extends StatelessWidget {
  const PageShell({
    required this.menuBar,
    required this.appBar,
    required this.body,
    super.key,
  });

  final Widget menuBar;
  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        menuBar,
        Expanded(
          child: Scaffold(
            appBar: appBar,
            body: body,
            backgroundColor: context.tbtColors.primaryContainer,
          ),
        ),
      ],
    );
  }
}
