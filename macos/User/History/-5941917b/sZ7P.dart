import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'package:common/src/theme/theme_data/tab_bar_theme.dart';

class UnderlineTabBar extends StatelessWidget {
  const UnderlineTabBar({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return _TabBarContainer(
      padding: EdgeInsets.zero,
      child: TabBar(
        tabs: tabs.map((t) => Tab(text: t)).toList(),
      ),
    );
  }
}

class HighlightTabBar extends StatelessWidget {
  const HighlightTabBar({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return _TabBarContainer(
      child: Theme(
        data: context.theme.copyWith(
          tabBarTheme: highlightTabBarTheme,
        ),
        child: TabBar(
          splashFactory: InkSplash.splashFactory,
          overlayColor: Color(0xffF1F6FF).msp,
          indicatorPadding: const PaddingSmaller(),
          tabs: tabs
              .map((t) => Tab(
                    text: t,
                  ))
              .toList(),
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
        border: Border(
          top: border,
          bottom: border,
        ),
      ),
      child: child,
    );
  }
}
