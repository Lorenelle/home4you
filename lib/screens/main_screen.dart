import 'package:flutter/material.dart';
import 'package:home4you/screens/post.dart';
import 'package:home4you/screens/profile.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  int value = 0;
  bool isInit = false;
  List<dynamic> pages = [
    Home(),
    Post(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[value],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        unselectedItemColor: Colors.grey,
        onTap: (val) => setState(() => value = val),
        currentIndex: value,
        elevation: 5,
        selectedItemColor: Colors.brown,
      ),
    );
  }
}
