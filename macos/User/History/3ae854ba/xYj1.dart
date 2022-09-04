import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys/user/user_service.dart';

import 'bloc/home_records_bloc.dart';
import 'widgets/record_list.dart';

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
  _HomeRecordsState createState() => _HomeRecordsState();
}

class _HomeRecordsState extends State<_HomeRecords> {
  _HomeRecordsState();

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
          const Expanded(
            child: TabBarView(children: [
              HomeRecordsTabView(),
              HomeRecordsTabView(),
              HomeRecordsTabView(),
            ]),
          )
        ],
      ),
    );
  }
}
