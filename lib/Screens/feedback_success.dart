import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/screens/navigaton_screen.dart';
class FeedbackSuccess extends StatefulWidget {


  @override
  State<FeedbackSuccess> createState() => _FeedbackSuccessState();
}

class _FeedbackSuccessState extends State<FeedbackSuccess> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Image.asset("images/done.png", height: size.height * 0.4),
          const Text("Your Feedback has been received. Thank you!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black)),
          const Text(
              "We'll improve your experience based on the feedback provided.",
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