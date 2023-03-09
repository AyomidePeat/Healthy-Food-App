import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class LoadingButton extends StatefulWidget {
 

  final onpressed;
  final Widget child;
  const LoadingButton(
      {this.onpressed,   this.child, key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: widget.onpressed,
          child:
              widget.child),
    );
  }
}
