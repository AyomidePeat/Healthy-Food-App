import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';

class  UserDetailsProvider with ChangeNotifier{
 UserDetailsModel userDetails; 

 
  UserDetailsProvider() : userDetails= UserDetailsModel(name: "", );

  Future getData()async{
    userDetails = await Firestore().getName();
    notifyListeners();
  }
}