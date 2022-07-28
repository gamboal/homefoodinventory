import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_food_inventory_app/Controller/UserProvider.dart';
import 'package:home_food_inventory_app/Model/UserDetail.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    UserDetail user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(user.name),
      ),
    );
  }
}
