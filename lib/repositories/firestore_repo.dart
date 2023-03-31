import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthfooddelivery/model/cart_model.dart';

import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class Firestore {
  static Future uploadNameAndAddressToDatabase({UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .set(user.toJson());
  }

  Future<UserDetailsModel> getUserNameAndAddress() async {
    DocumentSnapshot snapshot = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .get();
    if (snapshot.exists) {
      UserDetailsModel user = UserDetailsModel.getModelFromJson(
        json: snapshot.data() as dynamic,
      );
      return user;
    } else {
      return null;
    }
  }

  Future updateAddress({UserDetailsModel address}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .update(address.toJson());
  }

  // Future<UserDetailsModel> getAddress() async {
  //   DocumentSnapshot snapshot = await firebaseFirestore
  //       .collection('users')
  //       .doc(firebaseAuth.currentUser.uid)
  //       .get();
  //   if (snapshot.exists) {
  //     UserDetailsModel user = UserDetailsModel.getModelFromJson(
  //       json: snapshot.data() as dynamic,
  //     );
  //     return user;
  //   } else {
  //     return null;
  //   }
  // }

  Future addToCart({Cart cart}) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart-items")
        .doc()
        .set(cart.toJson());
  }
Stream<List<Cart>> getCartItems() {
  return firebaseFirestore
      .collection("users")
      .doc(firebaseAuth.currentUser.uid)
      .collection("cart-items")
      .snapshots()
      .map((querySnapshot) {
    return querySnapshot.docs
        .map((doc) => Cart.getModelFromJson(doc.data()))
        .toList();
  });
}


  Future deleteProductFromCart({String uid}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .doc(uid)
        .delete();
  }

  String listenToChanges() {
    String result = '';
    firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .snapshots()
        .listen((DocumentSnapshot snapshot) {
      result = snapshot.data().toString();

      print(snapshot.data());
    });
    return result;
  }

  List listenToCartChanges() {
    List result = [];
    firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> snapshot) {
      result = snapshot.docs.toList();

      print(snapshot.docs);
    });
    return result;
  }
}
