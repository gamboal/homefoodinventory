import 'package:flutter/material.dart';
import 'package:home_food_inventory_app/Controller/Authentication.dart';
import 'package:home_food_inventory_app/Model/UserDetail.dart';



class UserProvider with ChangeNotifier{
  UserDetail? _user;
  final Authentication _authentication = Authentication();

  UserDetail get getUser => _user!;

  Future<void> refreshUser() async{
    UserDetail user = await _authentication.getUserDetail();
    _user = user;
    notifyListeners();
  }
}