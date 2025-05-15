import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff03045E),
      selectedItemColor: Color(0xffE6E6EF),
      unselectedItemColor: Color(0xffE6E6EF),
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedLabelStyle: TextStyle(
        fontSize: 13.5,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(fontSize: 11.5),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/homelogo.png",
            height: selectedIndex == 0 ? 26 : 23,
            width: selectedIndex == 0 ? 32 : 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/mentorslogo.png",
            height: selectedIndex == 1 ? 26 : 23,
            width: selectedIndex == 1 ? 32 : 30,
          ),
          label: 'Explore Mentors',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/courseslogo.png",
            height: selectedIndex == 2 ? 26 : 23,
            width: selectedIndex == 2 ? 32 : 30,
          ),
          label: 'Courses',
        ),
      ],
    );
  }
}
