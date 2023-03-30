import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/cart_model.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/cart_item_widget.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';

class CartScreen extends StatefulWidget {
  // const CartScreen({.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Firestore firebaseFirestore = Firestore();
  TextEditingController addressController = TextEditingController();
  bool isSubmitted = false;
  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  getAddress() {
    String address;
    setState(() {
      String address = addressController.text;
    });
    return address;
  }

  Widget build(BuildContext context) {
    List<Cart> cartItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                actions: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: SizedBox(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFieldWidget(
                              controller: addressController,
                              hint: "Tell us your address",
                              obscure: false,
                            ),
                          ),
                          SizedBox(
                              height: 30,
                              child: FloatingActionButton(
                                  onPressed: () async {
                                    UserDetailsModel userAddress =
                                        UserDetailsModel(
                                            address: addressController.text);
                                    await firebaseFirestore
                                        .uploadAddressToDatabase(
                                            address: userAddress);
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              width: 100,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor: greenColor,
                                              content: Text("Address updated ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16))));
                                    }
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.send_outlined, size: 20)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              const Text(
                "Delivery to",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 14),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Icon(Icons.keyboard_arrow_down_outlined, size: 15),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Your Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(height: 18),
            Expanded(
              child: StreamBuilder<List<Cart>>(
                stream: firebaseFirestore.getCartItems(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    final cart = snapshot.data;
                    // cartItems = cart;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          Cart _cart = cart[index];

                          return ListTile(
                            title: CartItemWidget(
                              title: _cart.food,
                              thumbnailUrl: _cart.imageUrl,
                              cost: _cart.cost,
                            ),
                            onTap: () {},
                          );
                        });
                  } else {
                    String error = snapshot.error;
                    print(error);
                    return Center(
                      child: CircularProgressIndicator(color: greenColor),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildCart(Cart cart) => ListTile(
        leading: Container(child: Image.network("${cart.imageUrl}")),
        title: Text(cart.food),
        subtitle: Text(cart.cost.toString()),
      );
}
