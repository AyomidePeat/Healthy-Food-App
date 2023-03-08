import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/snackbar_widget.dart';
import 'package:healthfooddelivery/screens/navigaton_screen.dart';
class ReferAndEarnScreen extends StatefulWidget {
  // const ReferAndEarnScreen({.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()));
              },
              icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
          const Text(" Refer And Earn",
              style: TextStyle(
                  letterSpacing: 1.4,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserat')),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(children: [
          Image.asset(
            "images/refer.png",
            height: size.height * 0.7,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Share with your Friends",
              style: TextStyle(
                  color: greenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "montserrat")),
          const SizedBox(
            height: 7,
          ),
          const Text(
              "Share HealthyFoodDelivery with your friends, tell them how much they need a healthier life ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, fontSize: 13, fontFamily: "montserrat")),
          const SizedBox(height: 20),
          ClickButtons(
              onpressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: greenColor,
                    duration: Duration(seconds: 5),
                    content: Text("Referral Not Available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Montserrat"))));
              },
              text: "Share with Friends"),
        ])),
      ),
    );
  }
}
