import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:rainery/config/router/router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppRouter().screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.search_favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.setting), label: ''),
        ],
      ),
    );
  }
}
