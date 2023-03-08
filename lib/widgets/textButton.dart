import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class TextButtons extends StatefulWidget {
  final String text;
  final onPressed;
  const TextButtons({ this.onPressed, this.text, key});

  @override
  State<TextButtons> createState() => _TextButtonsState();
}

class _TextButtonsState extends State<TextButtons> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Text(widget.text,
            style: const TextStyle(
                color: greenColor,
                fontWeight: FontWeight.bold,
                fontFamily: "montserrat")));
  }
}
