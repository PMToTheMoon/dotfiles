import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'package:common/theme/theme.dart';

class Page extends StatelessWidget {
  const Page({
    this.padding = const PaddingPage.all(),
    this.alignment = Alignment.topCenter,
    this.drawer,
    this.onRefresh,
    this.body,
    this.appBar,
    this.scrollable = true,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    Key? key,
  }) : super(key: key);

  const Page.noScroll({
    this.padding = const PaddingPage.all(),
    this.alignment = Alignment.topCenter,
    this.onRefresh,
    this.body,
    this.appBar,
    this.drawer,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    Key? key,
  })  : scrollable = false,
        super(key: key);

  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final Widget? drawer;
  final Widget? body;
  final Widget? floatingActionButton;
  final Future<void> Function()? onRefresh;
  final PreferredSizeWidget? appBar;
  final bool scrollable;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    late Widget content;
    final refreshCallback = onRefresh;
    if (scrollable) {
      if (refreshCallback != null) {
        content = RefreshIndicator(
          onRefresh: refreshCallback,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: padding,
              child: body,
            ),
          ),
        );
      } else {
        content = SingleChildScrollView(
          child: Padding(
            padding: padding,
            child: body,
          ),
        );
      }
    } else {
      content = Padding(
        padding: padding,
        child: body,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      drawer: drawer,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Align(
          alignment: alignment,
          child: content,
        ),
      ),
    );
  }
}
