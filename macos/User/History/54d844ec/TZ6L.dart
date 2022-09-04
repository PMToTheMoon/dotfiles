import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ZanalysBottomNavigationBar extends StatelessWidget {
  const ZanalysBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(),
        ),
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Zanalys.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Zanalys.folder),
            label: 'folder',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
