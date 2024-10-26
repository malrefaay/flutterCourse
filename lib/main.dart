import 'package:flutter/material.dart';
import 'package:fluttercourse/data/product_service.dart';
import 'package:fluttercourse/settings_screen/settings_screen.dart';

import 'home_screen/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int homeScreenIndex = 0;

  void onTapBottomNavBar(int index) {
    setState(() {
      homeScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: homeScreenIndex,
        children: const [HomeScreen(), SettingsScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapBottomNavBar,
        currentIndex: homeScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
