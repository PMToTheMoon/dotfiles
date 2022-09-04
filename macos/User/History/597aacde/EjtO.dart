import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kPlaceholderNumber = 5;

class IdentityList<T extends IdentityData> extends StatelessWidget {
  const IdentityList({
    super.key,
    required this.identities,
    required this.avatarCacheService,
    this.onSelected,
  });

  final List<T>? identities;
  final AvatarCacheService avatarCacheService;
  final void Function(T)? onSelected;

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

      return ListView.separated(
        itemCount: identities!.length,
        separatorBuilder: _dividerBuilder,
        itemBuilder: identities != null ? _patientBuilder : _placeholderBuilder,
      );
    }
  }

  Widget _patientBuilder(BuildContext context, int index) {
    final identity = identities![index];
    return Material(
      color: context.colorScheme.surface,
      child: InkWell(
        onTap: () => onSelected?.call(identity),
        child: Padding(
          padding: const PaddingSmall(left | top | bottom),
          child: Identity(
            avatar: avatarCacheService.avatar(patient.id),
            firstName: patient.firstName ?? '',
            lastName: patient.lastName,
          ),
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
