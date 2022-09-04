class ZanalysBottomNavigationBar extends BottomNavigationBar {
  ZanalysBottomNavigationBar()
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
