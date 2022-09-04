import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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

class _HomeRecords extends StatefulWidget {
  const _HomeRecords();

  @override
  State<_HomeRecords> createState() => _HomeRecordsState();
}

class _HomeRecordsState extends State<_HomeRecords> {
  final inProgressTabKey = GlobalKey();
  final hightPriorityTabKey = GlobalKey();
  final draftsTabKey = GlobalKey();

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
                    key: inProgressTabKey,
                    data: state?.inProgress,
                  ),
                  HomeRecordsList(
                    key: hightPriorityTabKey,
                    data: state?.highPriority,
                  ),
                  HomeRecordsList(
                    key: draftsTabKey,
                    data: state?.drafts,
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
