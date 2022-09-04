import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:common/src/theme/theme_data/tab_bar_theme.dart';

class UnderlineTabBar extends StatelessWidget {
  const UnderlineTabBar({
    super.key,
    this.controller,
    required this.tabs,
  });

  final TabController? controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return _TabBarContainer(
      padding: EdgeInsets.zero,
      child: TabBar(
        controller: controller,
        tabs: tabs.map((t) => Tab(text: t)).toList(),
      ),
    );
  }
}

class HighlightTabBar extends StatelessWidget {
  const HighlightTabBar({
    super.key,
    this.controller,
    required this.tabs,
  });

  final TabController? controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return _TabBarContainer(
      child: Theme(
        data: context.theme.copyWith(
          tabBarTheme: highlightTabBarTheme,
        ),
        child: TabBar(
          controller: controller,
          // indicatorPadding: const PaddingSmaller(),
          tabs: tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
    );
  }
}

class _TabBarContainer extends StatelessWidget {
  const _TabBarContainer({
    Key? key,
    required this.child,
    this.padding = const PaddingSmaller.horizontal(),
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final border = BorderSide(
      color: context.colorScheme.outline,
    );
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border(
          top: border,
          bottom: border,
        ),
      ),
      child: Material(
        color: context.colorScheme.surface,
        child: child,
      ),
    );
  }
}
