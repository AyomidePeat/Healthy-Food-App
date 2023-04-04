import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
//import 'package:healthfooddelivery/repositories/auth_repo.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Firestore fireStore = Firestore();
  Future<String> signUp(
      {String name, String address, String email, String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && email != "" && password != "" && address != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await Firestore.uploadNameAndAddressToDatabase(user: user);

        output = "Success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }

  Future<String> signIn({String email, String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (email != "" && password != "") {
//functions
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "Success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }

  Future<String> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      e.message.toString();
    }
  }
}
