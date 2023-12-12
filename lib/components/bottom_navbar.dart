import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  BottomNav({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 10,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
            backgroundColor: Color.fromARGB(255, 175, 174, 174),
          ),
          GButton(
            icon: Icons.shop,
            text: "Cart",
            backgroundColor: Color.fromARGB(255, 175, 174, 174),
          ),
        ],
      ),
    );
  }
}
