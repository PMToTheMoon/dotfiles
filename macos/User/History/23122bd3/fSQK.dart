import 'package:flutter/widgets.dart';

class Record {}

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
  });

  final Widget function(BuildContext context, RecordCardData record) recordBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: ,
      itemBuilder: (),
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
