import 'package:flutter/material.dart';
import 'package:flutter_todo/components/bottom_navbar.dart';
import 'package:flutter_todo/pages/cart.dart';
import 'package:flutter_todo/pages/shop.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  googleNavigation(index) {
    setState(() {
      selectedPage = index;
    });
  }

  List pages = [
    const Shop(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 220),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: const Icon(Icons.menu),
        //     );
        //   },
        // ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        // To remove the border radius....
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      'lib/images/puma.png',
                      color: Colors.white,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.popAndPushNamed(context, "display_page");
                    },
                    leading: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: ListTile(
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNav(
        onTabChange: (index) => googleNavigation(index),
      ),
    );
  }
}
