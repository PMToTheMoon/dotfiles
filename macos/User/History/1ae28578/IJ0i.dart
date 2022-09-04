import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:models/models.dart';

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
  final List<CspUserRecordView>? data;
  final void Function(CspUserRecordView)? onSelected;
  final RecordCardData Function(CspUserRecordView) dataFactory;

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

    if (cards.isEmpty) {
      return const EmptyListIndicator(
        indicator: IndicatorType.noRecord,
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: cards
            .intersperseOuter(const Divider(
              height: 1,
            ))
            .toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
