import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/Screens/delivery_method_screen.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/model/product_model.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/cart_item_widget.dart';
import 'package:healthfooddelivery/widgets/navigation_pane.dart';

class CartScreen extends StatefulWidget {
  // const CartScreen({.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Firestore firebaseFirestore = Firestore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Delivery",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      body: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Your Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        const SizedBox(height: 18),
        StreamBuilder(
            stream: firebaseFirestore.getCartItem(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                final cart = snapshots.data;
                return ListView(children: cart.map(buildCart).toList());
              } else {
                return Center(
                    child: CircularProgressIndicator(color: greenColor));
              }
            })
      ])),
    );
  }

  Widget buildCart(Cart cart) => ListTile(
        leading: Container(child: Image.network("${cart.imageUrl}")),
        title: Text(cart.food),
        subtitle: Text(cart.cost.toString()),
      );
}
