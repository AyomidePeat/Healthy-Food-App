import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/login_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textButton.dart';

class ThirdWelcomeScreen extends StatefulWidget {
  //const ThirdWelcomeScreen({.key});

  @override
  State<ThirdWelcomeScreen> createState() => _ThirdWelcomeScreenState();
}

class _ThirdWelcomeScreenState extends State<ThirdWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onVerticalDragUpdate: (details) {},
        onHorizontalDragUpdate: (details) {
          if (details.delta.direction <= 0) {
            {
              Navigator.pop(context);
            }
          }
        },
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("images/home2.png",
                height: size.height * 0.6, width: size.width),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Taste Fresh Delicious Meal Anytime and Anywhere",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greenColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Container(height: 10, width:5,decoration: BoxDecoration( color:Color.fromARGB(255, 201, 199, 199), borderRadius:BorderRadius.circular(50))),
                const Icon(Icons.circle,
                    color: Color.fromARGB(255, 201, 199, 199), size: 5),
                const SizedBox(width: 5),
                const Icon(Icons.circle,
                    color: Color.fromARGB(255, 201, 199, 199), size: 5),
                // Container(height: 10, width:5,decoration: BoxDecoration( color:Color.fromARGB(255, 201, 199, 199), borderRadius:BorderRadius.circular(50))),
                const SizedBox(width: 5),
                const Icon(Icons.rectangle_rounded, color: greenColor, size: 8),
                //  Container(height: 10, width:15,decoration: BoxDecoration( color:greenColor, borderRadius:BorderRadius.circular(30))),
              ],
            ),
            const SizedBox(height: 15),
            ClickButtons(
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                text: "Next"),
            const SizedBox(height: 15),
            TextButtons(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                text: "Skip"),
          ],
        )));
  }
}
