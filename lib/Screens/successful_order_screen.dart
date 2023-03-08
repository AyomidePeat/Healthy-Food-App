import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/screens/navigaton_screen.dart';

class SuccessfulOrderScreen extends StatefulWidget {
  //const SuccessfulOrderScreen({.key});

  @override
  State<SuccessfulOrderScreen> createState() => _SuccessfulOrderScreenState();
}

class _SuccessfulOrderScreenState extends State<SuccessfulOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Image.asset("images/done.png", height: size.height * 0.4),
          const Text("Your order has been sucessfully placed",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
          const Text(
              "Sit and relax while your order is being worked on. It'll take 5min before you get it",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'montserrat', fontSize: 15, color: Colors.black)),
          SizedBox(height: size.height * 0.3),
          ClickButtons(
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()));
              },
              text: "Go back to home")
        ],
      ),
    ));
  }
}
