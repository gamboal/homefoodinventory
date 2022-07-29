import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_food_inventory_app/Model/Product.dart';
import 'package:uuid/uuid.dart';

class FirebaseFireStore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadProduct(
      String uid,
      String itemName,
      String itemDescription,
      String category,
      String expiryDate,
      String quantity,
      String location) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      if (itemName.isNotEmpty && itemDescription.isNotEmpty && category.isNotEmpty && expiryDate.isNotEmpty && quantity.isNotEmpty){
      String productID = const Uuid().v1(); // creates unique id based on time
      Product product = Product(
        uid: uid,
        itemName: itemName,
        itemDescription: itemDescription,
        category: category,
        expiryDate: expiryDate,
        quantity: quantity,
        location: location,
      );
      _firestore.collection('products').doc(productID).set(product.toJson());
      res = "Added";
      } else {
        res = "Please enter all details";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
