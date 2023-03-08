import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/screens/navigaton_screen.dart';

class UnderlinedTextButton extends StatefulWidget {
  final String text;

  const UnderlinedTextButton({this.text, key});

  @override
  State<UnderlinedTextButton> createState() => _UnderlinedTextButtonState();
}

class _UnderlinedTextButtonState extends State<UnderlinedTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationScreen()));
        },
        child: Text(
          widget.text,
          style: const TextStyle(
              color: greenColor,
              fontWeight: FontWeight.bold,
              fontFamily: "montserrat",
              decoration: TextDecoration.underline),
        ));
  }
}
