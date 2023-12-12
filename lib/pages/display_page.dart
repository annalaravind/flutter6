import 'package:flutter/material.dart';

void main() {
  runApp(const DisplayPage());
}

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 220, 220),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset("lib/images/puma.png"),
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
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 37, 37, 37),
                ),
                child: const Text(
                  "Shop Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
