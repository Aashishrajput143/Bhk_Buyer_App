import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onClicked;
  BottomMenu({this.selectedIndex, required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 69,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(0xFF5D2E17),
            unselectedItemColor: Colors.black54,
            currentIndex: selectedIndex,
            onTap: onClicked,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 32), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.store, size: 32), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined, size: 35), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list_outlined, size: 32), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline, size: 32), label: ''),
            ],
          ),
        ),
        // Floating Button based on the selected index
        Positioned(
          top: -20,
          left: _getFloatingButtonPosition(context, selectedIndex),
          child: Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                _getIconForIndex(selectedIndex),
                size: 32,
                color: Color(0xFF5D2E17),
              ),
              onPressed: () => onClicked(selectedIndex),
            ),
          ),
        ),
      ],
    );
  }

  // Get icon based on selected index
  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.store;
      case 2:
        return Icons.shopping_bag_outlined;
      case 3:
        return Icons.view_list_outlined;
      case 4:
        return Icons.person_outline;
      default:
        return Icons.home;
    }
  }

  // Get the position of the floating button based on selected index
  double _getFloatingButtonPosition(BuildContext context, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    switch (index) {
      case 0:
        return screenWidth * 0.1 - 35; // Home (first position)
      case 1:
        return screenWidth * 0.3 - 35; // Store
      case 2:
        return screenWidth * 0.5 - 35; // Cart
      case 3:
        return screenWidth * 0.7 - 35; // List
      case 4:
        return screenWidth * 0.9 - 35; // Profile
      default:
        return screenWidth * 0.1 - 35;
    }
  }
}
