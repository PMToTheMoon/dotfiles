import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HUbPage extends StatefulWidget {
  const HUbPage({
    Key? key,
  }) : super(key: key);

  @override
  _HUbPageState createState() => _HUbPageState();
}

class _HUbPageState extends State<HUbPage> {
  _HUbPageState();

  ZanalysBottomNavigationTab currentTab = ZanalysBottomNavigationTab.home;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: PageView(),
        ),
        ZanalysBottomNavigationBar(
          currentIndex: currentIndex,
          onSelected: onSelected,
        ),
      ],
    );
  }
}
