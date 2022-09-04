import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:neat/neat.dart';

typedef TypeSelectedCallback = void Function(RecordType);

class SelectRecordTypePage extends StatelessWidget {
  static SelectRecordTypePage builder(
    BuildContext context, {
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      SelectRecordTypePage(
        patient: patient,
        onTypeSelected: onTypeSelected,
      );

  static MaterialPageRoute materialPageRoute({
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      MaterialPageRoute(
        builder: (context) => builder(
          context,
          patient: patient,
          onTypeSelected: onTypeSelected,
        ),
      );

  static Future open(
    BuildContext context, {
    required Patient patient,
    TypeSelectedCallback? onTypeSelected,
  }) =>
      Navigator.of(context).push(materialPageRoute(
        patient: patient,
        onTypeSelected: onTypeSelected,
      ));

  const SelectRecordTypePage({
    super.key,
    required this.patient,
    this.onTypeSelected,
  });

  final Patient patient;
  final TypeSelectedCallback? onTypeSelected;

  @override
  Widget build(BuildContext context) {
    final AvatarCacheService avatarCacheService = GetIt.instance.get();

    return Scaffold(
      appBar: titleSubtitleAvatarAppBar(
        context,
        title: patient.displayFullName,
        subtitle: context.l10n.undefined_record_type_page_subtitle,
        image: avatarCacheService.avatar(patient.id),
      ),
      backgroundColor: context.colorScheme.surface,
      body: IdentityList<RecordType>(
        onSelected: onTypeSelected,
        identities: RecordType.values.toList(),
        identityBuilder: (type) => Identity(
          avatar: avatarCacheService.recordImage(type),
          firstName: type.displayName(context),
          subtitle: type.displaySubtile(context),
        ),
      ),
    );
  }
}
