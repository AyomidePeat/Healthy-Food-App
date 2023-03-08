import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class ClickButtons extends StatefulWidget {
  final onpressed;
  final String text;
  const ClickButtons({ this.onpressed,  this.text, key});

  @override
  State<ClickButtons> createState() => _ClickButtonsState();
}

class _ClickButtonsState extends State<ClickButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 30,
      width:MediaQuery.of(context).size.width*0.7,
     
      
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:greenColor,
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          onPressed: widget.onpressed,
          child: Text(widget.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'montserrat',
                fontWeight: FontWeight.bold,
              ))),
    );
  }
}
