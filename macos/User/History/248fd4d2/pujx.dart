import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:zanalys_api/zanalys_api.dart';

class HomeRecordsList extends StatefulWidget {
  const HomeRecordsList({
    Key? key,
    this.data,
    this.placeholderCount = 3,
  }) : super(key: key);

  final int placeholderCount;
  final List<CspUserRecord>? data;
  final void Function(CspUserRecord) onSelected;

  @override
  State<HomeRecordsList> createState() => _HomeRecordsListState();
}

class _HomeRecordsListState extends State<HomeRecordsList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Widget> cards = widget.data != null
        ? widget.data!
            .map(
              (data) => RecordCard(data),
            )
            .toList()
        : [];

    return SingleChildScrollView(
      child: Padding(
        padding: const PaddingSmall(),
        child: Column(
          children: cards
              .map((e) => Padding(
                    padding: const PaddingSmaller(bottom),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
