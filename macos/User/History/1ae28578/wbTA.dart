import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:zanalys_api/zanalys_api.dart';

const _kPlaceholderNumber = 4;

class HomeRecordsList extends StatefulWidget {
  const HomeRecordsList({
    Key? key,
    this.data,
    required this.dataFactory,
    this.placeholderCount = 3,
    this.onSelected,
  }) : super(key: key);

  final int placeholderCount;
  final List<CspUserRecord>? data;
  final void Function(CspUserRecord)? onSelected;
  final RecordCardData Function(CspUserRecord) dataFactory;

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
            .map((record) => RecordCard(
                  widget.dataFactory(record),
                  onTap: () => widget.onSelected?.call(record),
                ))
            .toList()
        : List.generate(
            _kPlaceholderNumber,
            (index) => const RecordCardShimmer(),
          );

    return SingleChildScrollView(
      child: Column(
        children: cards
            .intersperse(const Divider(
              height: 1,
            ))
            .toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
