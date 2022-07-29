import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String uid;
  final String itemName;
  final String itemDescription;
  final String category;
  final String expiryDate;
  final String quantity;
  final String location;

  const Product(
      {required this.uid,
      required this.itemName,
      required this.itemDescription,
      required this.category,
      required this.expiryDate,
      required this.quantity,
      required this.location,
      });

  static Product fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Product(
      uid: snapshot["uid"],
      itemName: snapshot["itemName"],
      itemDescription: snapshot["itemDescription"],
      category: snapshot["category"],
      expiryDate: snapshot["expiryDate"],
      quantity: snapshot['quantity'],
      location: snapshot['location']
    );
  }

   Map<String, dynamic> toJson() => {
        "uid": uid,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "category": category,
        "expiryDate": expiryDate,
        'quantity': quantity,
        'location': location,
      };
}