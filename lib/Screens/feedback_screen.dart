import 'dart:html';

import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';

class FeedbackScreen extends StatefulWidget {
  // const FeedbackScreen({.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedbackController = TextEditingController();
  @override
  void dispose() {
    feedbackController.dispose;

    super.dispose();
  }

  bool isPressed = false;
  bool isPressed2 = false;

  void pressedState() {
    setState(() {
      isPressed = !isPressed;
      isPressed2 = false;
    });
  }

  void pressedState2() {
    setState(() {
      isPressed2 = !isPressed2;
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavigationScreen()));
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
            const Text("Feed Back",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                    fontSize: 18)),
          ],
        ),
        centerTitle: false,
        //icon:Icons.arrowBack
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 20),
          const Text(
            "Give us your Feedback",
            style: TextStyle(
              color: greenColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Tell us about your experience, things you liked and areas of improvement. Your feedback is important to us.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "montserrat",
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // const SizedBox(width:5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Not Satisfied",
                      style: TextStyle(
                        fontFamily: "montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: isPressed ? Colors.red : Colors.grey,
                        size: 40,
                      ),
                      onPressed: pressedState),
                ],
              ),
              const SizedBox(
                width: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Satisfied",
                      style: TextStyle(
                        fontFamily: "montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 10),
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: isPressed2 ? greenColor : Colors.grey,
                        size: 40,
                      ),
                      onPressed: pressedState2),
                ],
              ),
            ],
          ),
          const SizedBox(height: 150),
          SingleChildScrollView(
            //controller: controller,
            child: TextFieldWidget(
                controller: feedbackController,
                obscure: true,
                hint: 'Write your feedback here'),
          ),
          SizedBox(height: size.height * 0.2),
          ClickButtons(onpressed: () {}, text: "Done"),
        ]),
      ),
    );
  }
}
