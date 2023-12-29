import 'package:flutter/material.dart';
import 'package:flutter_todo/theme/theme_user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const DisplayPage());
}

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
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
            const SizedBox(
              height: 40,
            ),
            const Text(
              "FOREVER FASTER IS ALWAYS FIRST, NEVER SECOND, NEVER THIRD.",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Puma India - Shop Online for Puma shoes & apparels and get Free Shipping. Buy Puma Shoes, Clothing, and Accessories for men, women and Kids in India.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "home_page");
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 60),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Text(
                  "Shop Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
