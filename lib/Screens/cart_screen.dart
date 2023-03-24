import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/cart_model.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/cart_item_widget.dart';

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
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Your Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          const SizedBox(height: 18),
          FutureBuilder(
            future: firebaseFirestore.getCartItems(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                final cart = snapshots.data;
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //  Cart _cart = cart[index];

                      return ListTile(
                        title: CartItemWidget(
                          title: cart[index].name,
                          thumbnailUrl: cart[index].image,
                        ),
                        onTap: () {},
                      );
                    });
              } else {
                String error = snapshots.error;
                print(error);
                return Center(
                  child: CircularProgressIndicator(color: greenColor),
                );
              }
            },
          ),
        ])),
      ),
    );
  }

  Widget buildCart(Cart cart) => ListTile(
        leading: Container(child: Image.network("${cart.imageUrl}")),
        title: Text(cart.food),
        subtitle: Text(cart.cost.toString()),
      );
}
