import 'package:flutter/material.dart';

class ZanalysBottomNavigationBar extends BottomNavigationBar {
  ZanalysBottomNavigationBar({super.key})
      : super(
          items: const [
            BottomNavigationBarItem(icon: Icon(Zanalys.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Zanalys.folder), label: 'folder'),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
}
