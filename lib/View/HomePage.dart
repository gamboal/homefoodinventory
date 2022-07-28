import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.yellow, 
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "", backgroundColor: Colors.green),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "", backgroundColor: Colors.green),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "", backgroundColor: Colors.green),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "", backgroundColor: Colors.green),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "", backgroundColor: Colors.green),
      ]),
    );
  }
}
