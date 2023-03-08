import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class FoodDeliveryScreen extends StatefulWidget {
  // const FoodDeliveryScreen({.key});

  @override
  State<FoodDeliveryScreen> createState() => _FoodDeliveryScreenState();
}

class _FoodDeliveryScreenState extends State<FoodDeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(""),
              const Text(
                'Hello Alex',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: greenColor),
              ),
              const Icon(Icons.menu),
            ],
          ),
          SizedBox(height: 15),
          //Food
        ],
      ),
    );
  }
}
