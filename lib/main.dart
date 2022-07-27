import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/View/LoginScreen.dart';
import 'package:home_food_inventory_app/View/SignupScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Food Inventory',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
