import 'package:flutter/material.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class TimeWidget extends StatefulWidget {
  bool value;
  final toggleValue;
  String time;
  TimeWidget({this.value, this.toggleValue, this.time, key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.toggleValue,
        child: Container(
            height: 25,
            width: 70,
            decoration: BoxDecoration(
                color: widget.value ? greenColor : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                border: Border.all(
                  color: widget.value ? greenColor : Colors.grey,
                  width: 0.5,
                )),
            child: Center(
                child: Text(
              widget.time,
              style: TextStyle(
                  color: widget.value
                      ? Colors.white
                      : Color.fromARGB(255, 169, 159, 159)),
            ))));
  }
}
