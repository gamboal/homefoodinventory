import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/Controller/Variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller:  pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.lightGreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: _page == 0 ? Colors.white : Colors.blueGrey),
              label: '',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: _page == 1 ? Colors.white : Colors.blueGrey),
              label: '',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle,
                  color: _page == 2 ? Colors.white : Colors.blueGrey),
              label: '',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color: _page == 3 ? Colors.white : Colors.blueGrey),
              label: '',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _page == 4 ? Colors.white : Colors.blueGrey),
              label: '',
              backgroundColor: Colors.green),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
