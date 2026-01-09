import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: GNav(
        color: Colors.grey[400], //for the unselected options
        activeColor: Colors.grey[800], //for selected options
        tabActiveBorder: Border.all(color: Colors.white), //adding a border
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 30,
        onTabChange: (value) {
          onTabChange!(value);
        },
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_bag, text: 'Cart'),
        ],
      ),
    );
  }
}
