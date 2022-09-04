import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';

import 'bloc/create_record_bloc.dart';

class CreateRecordPage extends StatelessWidget {
  static MaterialPageRoute materialPageRoute() =>
      MaterialPageRoute(builder: (context) => const CreateRecordPage());

  static Future open(BuildContext context) => Navigator.of(context).push(
        materialPageRoute(),
      );

  const CreateRecordPage({
    super.key,
  });

  final Patient patient;
  final RecordType recordType;

  @override
  Widget build(BuildContext context) {
    final AvatarCacheService avatarService = GetIt.instance.get();
    return BlocProvider(
      create: (context) => CreateRecordBloc(),
      child: Scaffold(
        appBar: titleSubtitleAvatarAppBar(
          context,
          title: context.l10n.add_doctor_page_title,
          subtitle: recordType.displayName(context),
          image: avatarService.avatar(patient.id),
        ),
        body: BlocBuilder<CreateRecordBloc, CreateRecordState>(
          builder: (context, state) => state.map(
            initial: (_) => LoadingIndicator(),
            create: (_) => LoadingIndicator(),
            success: (_) => LoadingIndicator(),
            error: (_) => LoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
