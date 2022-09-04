import 'package:flutter/widgets.dart';

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
  });

  final Widget function(Record record) recordBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: ,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
      itemCount: itemCount,
    );
  }
}
