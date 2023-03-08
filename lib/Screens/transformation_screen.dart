import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/successful_order_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class TransformationScreen extends StatefulWidget {
  // const TransformationScreen({.key});

  @override
  State<TransformationScreen> createState() => _TransformationScreenState();
}

class _TransformationScreenState extends State<TransformationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
              const Text("Share Transformation",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 18)),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/transform.png",
                height: size.height * 0.7,
              ),
              const SizedBox(height: 10),
              const Text(
                "Share your transformation image with your dietitian",
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 1.3,
                  color: greenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ClickButtons(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessfulOrderScreen()));
                  },
                  text: "Upload"),
            ],
          ),
        ),
      ),
    );
  }
}
