import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser({
    required String name,
    required String email,
    required String password,
    //required Uint8List file,
  }) async {
    String res = "Some error occrured";
    try {
      if (name.isNotEmpty || email.isNotEmpty || password.isNotEmpty){
        //register user authentication
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(userCred.user!.uid);
        //add user to the database
        _firestore.collection('users').doc(userCred.user!.uid).set({
          'name': name,
          'uid': userCred.user!.uid,
          'email': email,
        });
        res = "Success";
      }
    } on FirebaseAuthException catch(e){
      if (e.code == 'email-already-in-use'){
        res = 'The email address is already in use by another account.';
      } 
    }
    catch (e) {
      res = e.toString();
    }
    return res;
  }
}
