import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kPlaceholderNumber = 5;

const _kItemPadding = EdgeInsets.symmetric(
  horizontal: Dimensions.paddingSmall,
  vertical: Dimensions.paddingMedium,
);

class IdentityList<T> extends StatelessWidget {
  const IdentityList({
    super.key,
    required this.identities,
    required this.identityBuilder,
    this.onSelected,
    this.footer,
  });

  final List<T>? identities;
  final Identity Function(T) identityBuilder;
  final void Function(T)? onSelected;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    if (identities == null) {
      return ListView.separated(
        itemCount: _kPlaceholderNumber,
        separatorBuilder: _dividerBuilder,
        itemBuilder: _placeholderBuilder,
      );
    } else {
      if (identities?.isEmpty == true) return const EmptyListIndicator();
      int itemCount = identities!.length;
      if (footer != null) itemCount += 1;
      return ListView.separated(
        itemCount: itemCount,
        separatorBuilder: _dividerBuilder,
        itemBuilder:
            identities != null ? _identityBuilder : _placeholderBuilder,
      );
    }
  }

  Widget _identityBuilder(BuildContext context, int index) {
    if (index >= identities!.length) return footer!;
    final identity = identities![index];
    return Material(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: () => onSelected?.call(identity),
        child: Padding(
          padding: _itemPadding,
          child: identityBuilder(identity),
        ),
      ),
    );
  }
}

Widget _dividerBuilder(context, index) => const Divider(
      height: 1,
      indent: Dimensions.sizeLarge,
    );

Widget _placeholderBuilder(BuildContext context, int index) {
  return const Padding(
    padding: PaddingSmall(left | top | bottom),
    child: IdentityShimmer(),
  );
}
