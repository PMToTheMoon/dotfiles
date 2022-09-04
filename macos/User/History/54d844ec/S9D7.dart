import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum ZanalysBottomNavigationTab {
  home,
  patient,
}

class ZanalysBottomNavigationBar extends StatelessWidget {
  const ZanalysBottomNavigationBar({
    Key? key,
    required this.currentTab,
    required this.onSelected,
  }) : super(key: key);

  final ZanalysBottomNavigationTab currentTab;
  final ValueChanged<ZanalysBottomNavigationTab> onSelected;

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
        currentIndex: currentTab.index,
        onTap: (i) => onSelected(ZanalysBottomNavigationTab.values[i]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.folder),
            label: 'folder',
          ),
          BottomNavigationBarItem(
            icon: Icon(FeatherIcons.image),
            label: 'image',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
