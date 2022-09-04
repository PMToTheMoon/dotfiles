import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum ZanalysBottom {
  home,
  patient,
}

class ZanalysBottomNavigationBar extends StatelessWidget {
  const ZanalysBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onSelected,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: context.colorScheme.outline,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onSelected,
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
