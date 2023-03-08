import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
//import 'package:healthfooddelivery/widgets/navigation_pane.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';

class GuidelinesScreen extends StatefulWidget {
  // const GuidelinesScreen({.key});

  @override
  State<GuidelinesScreen> createState() => _GuidelinesScreenState();
}

class _GuidelinesScreenState extends State<GuidelinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>NavigationScreen()));
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
              
            ],
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Image.asset(
              "images/guidelines.png",
              height: MediaQuery.of(context).size.height * 0.7,
            ),
            const SizedBox(height: 15),
            const Text("No Guidelines Found!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ],
        )));
  }
}
