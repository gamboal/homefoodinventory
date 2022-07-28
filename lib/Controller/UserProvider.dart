import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/Controller/Authentication.dart';
import 'package:home_food_inventory_app/Model/User.dart';
import 'package:flutter/widgets.dart';



class UserProvider with ChangeNotifier{
  User? _user;
  final Authentication _authentication = Authentication();

  User get getUser => _user!;

  Future<void> refreshUser() async{
    User user = await _authentication.getUserDetail();
    _user = user;
    notifyListeners();
  }
}