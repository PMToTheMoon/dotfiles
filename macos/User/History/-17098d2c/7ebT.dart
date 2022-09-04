import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:models/models.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/record/hub/hub.dart';
import 'package:zanalys/record/record_service.dart';
import 'package:zanalys/user/user_service.dart';

import 'bloc/home_records_bloc.dart';
import 'widgets/home_record_list.dart';

class HomeRecords extends StatelessWidget {
  const HomeRecords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RecordService recordService = GetIt.instance.get();
    return BlocProvider(
      create: (context) => HomeRecordsBloc(
        userId: GetIt.instance.get<UserService>().user!.id!,
        recordService: recordService,
        initialRecords: recordService.records,
        recordsStream: recordService.recordsStream,
      ),
      child: const _HomeRecords(),
    );
  }
}

class _HomeRecords extends StatelessWidget {
  const _HomeRecords();

  void _onSelectRecord(
    BuildContext context,
    CspUserRecordView record,
  ) {
    Navigator.of(context).push(HubPage.materialPageRoute(
      recordId: record.id,
      patient: record.pa,
    ));
    // context.read<HomeRecordsBloc>().(record.id);
  }

  void _onDeleteRecord(
    BuildContext context,
    CspUserRecordView record,
  ) {
    context.showConfirmationDialog(
      'Supprimer le brouillon ?',
      'Voulez-vous vraiment supprimer le brouillon ?',
      onAccept: () {
        context.read<HomeRecordsBloc>().deleteRecord(record.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.select((AuthBloc bloc) => bloc.state.user?.id);
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HighlightTabBar(
            tabs: [
              context.l10n.home_tab_in_progress,
              context.l10n.home_tab_high_priority,
              context.l10n.home_tab_draft,
            ],
          ),
          Expanded(
            child: BlocBuilder<HomeRecordsBloc, HomeRecordsState?>(
              builder: (context, HomeRecordsState? state) => TabBarView(
                children: [
                  HomeRecordsList(
                    data: state?.inProgress,
                    onSelected: (record) => _onSelectRecord(context, record),
                    dataFactory: (e) => e.toRecordCardWithStatusData(
                      context,
                      userId: userId!,
                    ),
                  ),
                  HomeRecordsList(
                    data: state?.highPriority,
                    onSelected: (record) => _onSelectRecord(context, record),
                    dataFactory: (record) => record.toRecordCardWithStatusData(
                      context,
                      userId: userId!,
                    ),
                  ),
                  HomeRecordsList(
                    data: state?.drafts,
                    onSelected: (record) => _onSelectRecord(context, record),
                    dataFactory: (record) =>
                        record.toRecordCardWithEditButtonData(context,
                            userId: userId!,
                            onDelete: record.doctorId == userId
                                ? () => _onDeleteRecord(context, record)
                                : null),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
