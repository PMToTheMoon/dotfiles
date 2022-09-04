import 'package:flutter/widgets.dart';

class Record {}

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
  });

  final Widget Function(
    BuildContext context,
    RecordCardData record,
    RecordListBloc bloc,
  ) recordBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => recordBuilder(context, rec),
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}

class _RecordList extends StatelessWidget {
  const _RecordList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => recordBuilder(context, rec),
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
