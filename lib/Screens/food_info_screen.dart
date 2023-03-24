import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/cart_model.dart';
import 'package:healthfooddelivery/model/recipe_model.dart';
import 'package:healthfooddelivery/model/recipe.api.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/screens/cart_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';

class FoodInfoScreen extends StatefulWidget {
  final recipes;
  const FoodInfoScreen({@required this.recipes, key});

  @override
  State<FoodInfoScreen> createState() => _FoodInfoScreenState();
}

class _FoodInfoScreenState extends State<FoodInfoScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  Firestore firestore = Firestore();
  @override
  bool isPressed = false;
  void favButton() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  Widget build(BuildContext context) {
    Cart cartItem = Cart(cost: 15, food:widget.recipes.name ,imageUrl:  widget.recipes.images,);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.black)),
                  IconButton(
                      onPressed: () {
                        favButton();
                      },
                      icon: Icon(
                          isPressed ? Icons.favorite : Icons.favorite_border,
                          color: isPressed ? greenColor : Colors.black)),
                ])),
        body:
            //  _isLoading
            //             ? Center(child: CircularProgressIndicator(color: greenColor))
            // :
            Hero(
          tag: widget.recipes,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.recipes.name,
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("410 cal | Low calorie",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "montserrat",
                    fontSize: 14,
                  )),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.circular(15),
                 
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.multiply,
                    ),
                    image: NetworkImage(
                      widget.recipes.images,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              const Text("\$15",
                  style: TextStyle(
                      color: greenColor,
                      fontSize: 17,
                      fontFamily: "Montserrat")),
              SizedBox(
                width: 70,
                child: ClickButtons(
                    onpressed: () async {
                       await firestore.addToCart(cart: cartItem);
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            width: 15,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: greenColor,
                            content: Text("Added to Cart;",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16))));
                      }
                    },
                    text: "Add"),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: const Text("Delivery info",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Sed ullamcorper morbi tincidunt ornare massa eget egestas. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Fermentum leo vel orci porta non pulvinar neque. Risus quis varius quam quisque id. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec. Ut sem nulla pharetra diam sit amet nisl. Enim tortor at auctor urna nunc id cursus metus aliquam. Sit amet est placerat in egestas erat. Est ante in nibh mauris. Viverra nibh cras pulvinar mattis nunc. Orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Mi eget mauris pharetra et ultrices neque ornare aenean..",
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            fontFamily: "Montserrat",
                          ))),
                  const SizedBox(
                    height: 20,
                  ),
                  ClickButtons(
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      text: "Go to cart"),
                ],
              ),
            ),
          ]),
        ));
  }
}
