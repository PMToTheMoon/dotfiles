import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:zanalys/hub/home/records/bloc/home_records_bloc.dart';
import 'package:zanalys/user/user_service.dart';

typedef RecordBuilder = Widget Function(
  BuildContext context,
  RecordCardData record,
);

class RecordList extends StatelessWidget {
  const RecordList({
    required this.builder,
    super.key,
  });

  final RecordBuilder builder;

  @override
  Widget build(BuildContext context) {
    final UserService userService = GetIt.instance.get();
    return BlocProvider(
      create: (context) => RecordListBloc(),
      child: _RecordList(builder),
    );
  }
}

class _RecordList extends StatelessWidget {
  const _RecordList(this.builder);

  final RecordBuilder builder;

  @override
  Widget build(BuildContext context) {
    final state = context.select((RecordListBloc bloc) => bloc.state);

    Widget _buildItem(BuildContext context, int index) {
      final record = state[index];
      return builder(context, record);
    }

    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: state.length,
    );
  }
}
