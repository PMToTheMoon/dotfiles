import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordCardData {}

class RecordListBloc extends Cubit<List<RecordCardData>> {
  RecordListBloc() : super([]);
}

typedef RecordBuilder = Widget Function(
  BuildContext context,
  RecordCardData record,
  RecordListBloc bloc,
);

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecordListBloc(),
    );
  }
}

class _RecordList extends StatelessWidget {
  const _RecordList(this.records);

  final List<Record> records;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => recordBuilder(context, rec),
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
