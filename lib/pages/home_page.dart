import 'package:flutter/material.dart';
import 'package:flutter_todo/components/bottom_navbar.dart';
import 'package:flutter_todo/pages/cart.dart';
import 'package:flutter_todo/pages/shop.dart';
import 'package:flutter_todo/theme/theme_user.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          "Flutter e-Commerce",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
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
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                    child: Consumer<ThemeUser>(
                      builder: (context, themeUser, _) {
                        return ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            themeUser.isDarkMode ? Colors.white : Colors.black,
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            'lib/images/puma.png',
                          ),
                        );
                      },
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
                      ),
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.info,
                      ),
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Provider.of<ThemeUser>(context, listen: false)
                          .toggleOnTap();
                    },
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Consumer<ThemeUser>(
                        builder: (context, themeUser, _) {
                          return Icon(
                            themeUser.isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                          );
                        },
                      ),
                    ),
                    title: Consumer<ThemeUser>(
                      builder: (context, themeUser, _) {
                        return Text(
                          themeUser.isDarkMode ? "Light Mode" : "Dark Mode",
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        );
                      },
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
                  ),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
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
