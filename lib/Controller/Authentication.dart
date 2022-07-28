// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_food_inventory_app/Model/UserDetail.dart';
import 'dart:typed_data';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserDetail> getUserDetail() async{
    User currentUser = _auth.currentUser!;

    DocumentSnapshot currentUserSnap = await _firestore.collection('user').doc(currentUser.uid).get();

    return UserDetail.fromSnap(currentUserSnap);
  }

  Future<String> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "Some error occrured";
    try {
      if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        //register user authentication
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(userCred.user!.uid);
        //add user to the database

        UserDetail user =
            UserDetail(name: name, uid: userCred.user!.uid, email: email);

        _firestore.collection('users').doc(userCred.user!.uid).set(
              user.toJson(),
            );
        res = "Success";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        res = 'The email address is already in use by another account';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        res = "You've entered the wrong password";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
