import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class LoadingButton extends StatefulWidget {
  final child;
  final bool isLoading;
  final onpressed;
  final String text;
  const LoadingButton({ this.onpressed, this.child, this.isLoading, this.text, key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 30,
      width:MediaQuery.of(context).size.width*0.7,
     
      
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:greenColor,
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          onPressed: widget.onpressed,

          child: widget.isLoading ? const Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AspectRatio(aspectRatio: 1/1,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          )
          :widget.child 
         ),
    );
  }
}
