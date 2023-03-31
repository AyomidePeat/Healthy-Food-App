import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/cart_model.dart';

import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/screens/cart_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

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

  bool textRead = false;
  bool readMore = false;
  Widget build(BuildContext context) {
    Cart cartItem = Cart(
      cost: 15,
      food: widget.recipes.name,
      imageUrl: widget.recipes.imageUrl,
      calorie: widget.recipes.calories.toString(),
    );
    return Scaffold(
        // title:
        body:
            //  _isLoading
            //             ? Center(child: CircularProgressIndicator(color: greenColor))
            // :
            Stack(
              children: [
                Stack(children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        textRead = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.35),
                            BlendMode.multiply,
                          ),
                          image: NetworkImage(
                            widget.recipes.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 50),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back_ios,
                                          color: Colors.white)),
                                  IconButton(
                                      onPressed: () {
                                        favButton();
                                      },
                                      icon: Icon(
                                          isPressed
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              isPressed ? greenColor : Colors.white)),
                                ])),
                      ),
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onVerticalDragUpdate: (var isDraggedUp) {
                      setState(() {
                        textRead = true;
                      });
                    },
                    child: Container(
                      height: textRead
                          ? MediaQuery.of(context).size.height * 0.8
                          : MediaQuery.of(context).size.height * 0.47,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                          color: Colors.white),
                      // ,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 58),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: Text(widget.recipes.name,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "montserrat",
                                                fontSize: 23,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.alarm, color: greenColor),
                                            Text("${widget.recipes.totalTime} mnutes",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "montserrat",
                                                  fontSize: 14,
                                                )),
                                            Text("| ${widget.recipes.calories} cal",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "montserrat",
                                                  fontSize: 14,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("\$15",
                                      style: TextStyle(
                                          color: greenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          fontFamily: "Montserrat")),
                                ],
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text("Delivery info",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ))),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ExpandableText(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Sed ullamcorper morbi tincidunt ornare massa eget egestas. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Fermentum leo vel orci porta non pulvinar neque. Risus quis varius quam quisque id. Fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec. Ut sem nulla pharetra diam sit amet nisl. Enim tortor at auctor urna nunc id cursus metus aliquam. Sit amet est placerat in egestas erat. Est ante in nibh mauris. Viverra nibh cras pulvinar mattis nunc. Orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Mi eget mauris pharetra et ultrices neque ornare aenean..",
                                            readMoreText: 'Read more',
                                            onLinkPressed: (readMore) {
                                          setState(() {
                                            textRead = readMore;
                                          });
                                         
                                        },
                                            readLessText: "Show less",
                                            linkTextStyle:
                                                const TextStyle(color: greenColor),
                                            trimType: TrimType.lines,
                                            trim: textRead ? 20 : 3,
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontFamily: "Montserrat",
                                            ))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ClickButtons(
                                          onpressed: () async {
                                            await firestore.addToCart(cart: cartItem);
                                            {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      duration: Duration(
                                                          milliseconds: 1000),
                                                      width: 150,
                                                      behavior:
                                                          SnackBarBehavior.floating,
                                                      backgroundColor: greenColor,
                                                      content: Text("Added to Cart",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 16))));
                                            }
                                          },
                                          text: "Add"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}
