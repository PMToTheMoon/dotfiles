import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

import 'custom_rounded_rectangle_shape.dart';

class TbtTabBar extends StatelessWidget {
  const TbtTabBar({
    super.key,
    required this.tabs,
    this.indicatorHorizontalMargin = Dimensions.paddingSmall,
  });

  final double indicatorHorizontalMargin;
  final List<String> tabs;

  Widget _buildTab(String text) {
    return Padding(
      padding: PaddingMedium.horizontal(),
      child: Tab(
        text: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // labelPadding: PaddingMedium.horizontal(),
      // indicatorPadding: PaddingSmall.horizontal(),
      tabs: [
        Padding(
          padding: PaddingMedium.horizontal(),
          child: Tab(
            text: 'first',
          ),
        ),
        Tab(
          text: 'second',
        ),
        Tab(
          text: 'third',
        ),
      ],
    );
  }
}

class TbtCardTabBar extends StatelessWidget {
  const TbtCardTabBar({
    super.key,
    this.controller,
    required this.tabs,
    this.tabBorderRadius = const Radius.circular(Dimensions.borderRadiusSmall),
    this.tabPadding = const PaddingSmall.horizontal(),
    this.tabBarPadding,
    this.onTap,
  });

  final TabController? controller;
  final List<String> tabs;
  final Radius tabBorderRadius;
  final EdgeInsets tabPadding;
  final EdgeInsets? tabBarPadding;
  final ValueChanged<int>? onTap;

  Decoration _indicator(BuildContext context) {
    final borderSide = BorderSide(color: context.colorScheme.outline);
    return ShapeDecoration(
      color: context.colorScheme.surface,
      shape: CustomRoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: tabBorderRadius,
          topRight: tabBorderRadius,
        ),
        topSide: borderSide,
        rightSide: borderSide,
        leftSide: borderSide,
        topLeftCornerSide: borderSide,
        topRightCornerSide: borderSide,
      ),
    );
  }

  Iterable<Widget> _buildTabs() => tabs.map(
        (e) => Padding(
          padding: tabPadding,
          child: Tab(text: e),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      padding: tabBarPadding,
      indicator: _indicator(context),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: context.colorScheme.primary,
      unselectedLabelColor: context.colorScheme.onSurface,
      tabs: _buildTabs().toList(),
      onTap: onTap,
    );
  }
}
