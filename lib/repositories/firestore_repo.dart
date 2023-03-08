import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthfooddelivery/model/product_model.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class Firestore {
  static Future uploadNameToDatabase({UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .set(user.toJson());
  }

  Future getName() async {
    QueryDocumentSnapshot<Map<String, dynamic>> snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .get();
    UserDetailsModel userModel = UserDetailsModel.fromJson(
      (snap.data() as dynamic),
    );

    print(userModel.toJson());
    return userModel;
  }

  getUserName() {
    final docRef =
        firebaseFirestore.collection("users").doc(firebaseAuth.currentUser.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  Future addToCart({Cart cart}) async {
    final docUser = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart-items")
        .doc(cart.food)
        .set(cart.toJson());
  }

  Future getCartItems({Cart cart}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .get();
  }

  Stream<List<Cart>> getCartItem() => firebaseFirestore
      .collection("users")
      .doc(firebaseAuth.currentUser.uid)
      .collection("cart")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Cart.fromJson(doc.data())).toList());

  Future deleteProductFromCart({String uid}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .doc(uid)
        .delete();
  }
}
