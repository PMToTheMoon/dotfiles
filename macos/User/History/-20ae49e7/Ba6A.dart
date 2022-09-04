import 'package:common/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

class LoadedList extends StatelessWidget {
  const LoadedList({
    this.loadingIndicator = const LoadingIndicator(),
    this.header,
    this.footer,
    this.spacing,
    this.separator,
    this.emptyIndicator,
    this.children,
    this.placeIndicatorsInsideList = false,
    this.outerSpace = true,
    this.applyItemPaddingOnHeader = false,
    this.applyPaddingOnFooter = false,
    this.applyPaddingOnSeparator = false,
    super.key,
  });

  // final int? itemCount;
  final Widget? header;
  final Widget? footer;
  final Widget? spacing;
  final Widget? separator;
  final Widget? emptyIndicator;
  final Widget loadingIndicator;
  final List<Widget>? children;

  final EdgeInsetsGeometry? itemPadding;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? footerPadding;
  final EdgeInsetsGeometry? separatorPadding;
  final EdgeInsetsGeometry? indicatorPadding;

  /// Determine if [itemPadding] should be applied to header
  /// Have no effect if [headerPadding] is not null
  final bool applyItemPaddingOnHeader;

  /// Determine if [itemPadding] should be applied to footer
  /// Have no effect if [footerPadding] is not null
  final bool applyItemPaddingOnFooter;

  /// Determine if [itemPadding] should be applied to separator
  /// Have no effect if [separatorPadding] is not null
  final bool applyItemPaddingOnSeparator;

  /// Determine if [itemPadding] should be applied to indicators
  /// /// Have no effect if [indicatorPadding] is not null
  final bool applyItemPaddingOnIndicators;

  /// if true, place indicators inside list as normal child
  final bool placeIndicatorsInsideList;

  // if set to true and [spacing] is not null, place space at the top
  // and the bottom of the list
  final bool outerSpace;

  bool get _showLoadingIndicator => children == null;
  bool get _showEmptyIndicator => children?.isEmpty == true;

  Widget? get _effectiveHeader {
    if (headerPadding != null) return header?.withPadding(headerPadding!);
    if (applyItemPaddingOnHeader && itemPadding != null) {
      return header?.withPadding(itemPadding!);
    }
    return header;
  }

  Widget? get _effectiveFooter {
    if (footerPadding != null) return footer?.withPadding(footerPadding!);
    if (applyItemPaddingOnFooter && itemPadding != null) {
      return footer?.withPadding(itemPadding!);
    }
    return footer;
  }

  Widget? get _effectiveSeparator {
    if (separatorPadding != null) {
      return separator?.withPadding(separatorPadding!);
    }
    if (applyItemPaddingOnSeparator && itemPadding != null) {
      return separator?.withPadding(itemPadding!);
    }
    return separator;
  }

  Widget? _maybeWrapIndicatorWithPadding(Widget? indicator) {
    if (indicatorPadding != null) {
      return indicator?.withPadding(indicatorPadding!);
    }
    if (applyItemPaddingOnIndicators && itemPadding != null) {
      return indicator?.withPadding(itemPadding!);
    }
    return indicator;
  }

  @override
  Widget build(BuildContext context) {
    // int? effectiveItemCount = itemCount;
    // if (effectiveItemCount != null) {
    //   if (header != null) effectiveItemCount++;
    //   if (footer != null) effectiveItemCount++;
    //   if (separator != null) effectiveItemCount = (effectiveItemCount * 2) - 1;
    //   if (spacing != null) effectiveItemCount = (effectiveItemCount * 2) - 1;
    // }
    // if (children == null && items.)

    Iterable<Widget> effectiveChildren = [];
    if (children?.isNotEmpty == true || placeIndicatorsInsideList) {
      effectiveChildren = [
        if (header != null) _effectiveHeader!,
        if (_showEmptyIndicator) emptyIndicator!,
        if (_showLoadingIndicator) loadingIndicator,
        ...?children,
        if (footer != null) _effectiveFooter!,
      ];
    } else {
      if (_showEmptyIndicator) return emptyIndicator!;
      return loadingIndicator;
    }

    if (separator != null) {
      effectiveChildren = effectiveChildren.intersperse(_effectiveSeparator!);
    }
    if (spacing != null) {
      effectiveChildren = effectiveChildren.intersperse(spacing!);
    }

    final items = effectiveChildren.toList();

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

extension _WrapWithPadding on Widget? {
  Widget? withPadding(EdgeInsetsGeometry padding) => this == null
      ? null
      : Padding(
          padding: padding,
          child: this,
        );
}
