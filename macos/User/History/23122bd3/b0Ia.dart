import 'package:flutter/widgets.dart';

class Record {}

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
  });

  final Widget function(BuildContext context, RecordCardData record, RecordListBloc bloc,) recordBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
      itemBuilder: (),
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
