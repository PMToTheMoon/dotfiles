import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HomeRecordsList extends StatelessWidget {
  const HomeRecordsList({
    Key? key,
    this.data,
    this.placeholderCount = 3,
  }) : super(key: key);

  final int placeholderCount;
  final List<RecordCardData>? data;

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = data != null
        ? data!
            .map((data) => RecordCard(
                  data: data,
                ))
            .toList()
        : [];

    return ListView.separated(
      itemBuilder: (context, index) => RecordCard(data: data[index]),
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const PaddingSmall(),
        child: Column(
          children: cards,
        ),
      ),
    );
  }
}
