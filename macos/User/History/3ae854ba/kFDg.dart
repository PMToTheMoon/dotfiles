import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/user/user_service.dart';

import 'bloc/home_records_bloc.dart';
import 'widgets/home_record_list.dart';

class HomeRecords extends StatelessWidget {
  const HomeRecords({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserService userService = GetIt.instance.get();
    return BlocProvider(
      create: (context) => HomeRecordsBloc(
        userService: userService,
        initialRecords: userService.records,
        recordsStream: userService.recordsStream,
      ),
      child: const _HomeRecords(),
    );
  }
}

class _HomeRecords extends StatelessWidget {
  const _HomeRecords();

  void _onDeleteRecord(CspUserRecord record) {
    context.read<HomeRecordsBloc>().deleteRecord(record.id);
  }

  @override
  Widget build(BuildContext context) {
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
                    data: state?.inProgress
                        .map((e) => e.toRecordCardWithStatusData(
                              userId: context.read<AuthBloc>().state.user!.id!,
                              onTap: () {},
                            ))
                        .toList(),
                  ),
                  HomeRecordsList(
                    data: state?.highPriority
                        .map((e) => e.toRecordCardWithStatusData(
                              userId: context.read<AuthBloc>().state.user!.id!,
                              onTap: () {},
                            ))
                        .toList(),
                  ),
                  HomeRecordsList(
                    data: state?.drafts
                        .map((record) => record.toRecordCardWithEditButtonData(
                              userId: context.read<AuthBloc>().state.user!.id!,
                              onTap: () => _onSelectRecord(record),
                              onDelete: () => _onDeleteRecord(record),
                            ))
                        .toList(),
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
