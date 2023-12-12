import 'package:flutter/material.dart';
import 'package:flutter_todo/models/model_cart.dart';
import 'package:flutter_todo/pages/display_page.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ModelCart();
      },
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const DisplayPage(),
          routes: {
            "home_page": (context) => const HomePage(),
            "display_page": (context) => const DisplayPage(),
          },
        );
      },
    );
  }
}
