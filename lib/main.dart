import 'package:flutter/material.dart';
import 'package:flutter_todo/models/model_cart.dart';
import 'package:flutter_todo/pages/display_page.dart';
import 'package:flutter_todo/pages/home_page.dart';
import 'package:flutter_todo/theme/theme_user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeUser>(
          create: (context) => ThemeUser(),
        ),
        ChangeNotifierProvider<ModelCart>(
          create: (context) => ModelCart(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DisplayPage(),
      theme: Provider.of<ThemeUser>(context).gettingThemeData,
      routes: {
        "home_page": (context) => const HomePage(),
        "display_page": (context) => const DisplayPage(),
      },
    );
  }
}
