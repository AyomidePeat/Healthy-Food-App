import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textButton.dart';
import 'package:healthfooddelivery/Screens/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'images/salad.png',
    'images/home2.png',
    'images/home3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  itemCount: _imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              
                  
                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Column(
                //     children: [
                //                          ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 70.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              
              children: <Widget>[
 // const  SizedBox(height: 10.0),
                                     const Text(
                "Taste Fresh Delicious Meal Anytime and Anywhere",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greenColor,
                  fontSize:15,
                  fontFamily: 'Montserrat',
                  //fontWeight: FontWeight.bold,
                ),
              ),
              const  SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_imageUrls.length, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: CircleAvatar(
                              minRadius: 5,
          
                              backgroundColor: _currentIndex == index
                                  ? greenColor
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),

               SizedBox(height: 25.0),
                ClickButtons(
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                text: "Next"),
                 SizedBox(height: 20.0),
               TextButtons(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                text: "Skip"),
               
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

