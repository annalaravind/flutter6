import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNav extends StatefulWidget {
  void Function(int)? onTabChange;
  BottomNav({
    super.key,
    required this.onTabChange,
  });

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 10,
        onTabChange: (value) => widget.onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          GButton(
            icon: Icons.shop,
            text: "Cart",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
