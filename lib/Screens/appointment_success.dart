import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/screens/navigaton_screen.dart';

import '../widgets/buttons.dart';

class AppointmentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
      child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset("images/done.png", height: size.height * 0.4),
            const Text("Your Appointment has been booked",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black)),
            const Text(
                "We'll be in touch with you shortly.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'montserrat', fontSize: 15, color: Colors.black)),
            SizedBox(height: size.height * 0.3),
            ClickButtons(
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>NavigationScreen()));
                },
                text: "Go back to home")
          ],
      ),
    ),
        ));
  }
}
