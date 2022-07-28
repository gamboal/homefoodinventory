import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDetail {
  final String name;
  final String uid;
  final String email;

  const UserDetail({
    required this.name,
    required this.uid,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "email": email,
      };

  static UserDetail fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserDetail(
      name: snapshot['name'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
