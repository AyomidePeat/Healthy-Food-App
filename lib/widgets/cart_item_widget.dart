import 'package:flutter/material.dart';

import 'package:healthfooddelivery/widgets/color.dart';

class CartItemWidget extends StatefulWidget {
 // final ProductModel product;
  final String thumbnailUrl;
  final String title;
  const CartItemWidget({key,  this.thumbnailUrl, this.title});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int counter = 1;
  void incrementer() {
    setState(() {
      counter++;
    });
  }

  void decrementer() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.thumbnailUrl),
            ),
          ),
        ),
        Column(
          children: [
            Text(widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                )),
            const Text("\$15",
                style: TextStyle(
                  color: greenColor,
                  fontSize: 13,
                )),
          ],
        ),
        SizedBox(
          width: 5,
          height: 5,
          child: FloatingActionButton(
            onPressed: decrementer,
            backgroundColor: greenColor,
            child: const Icon(Icons.remove, color: Colors.white),
          ),
        ),
        AnimatedSwitcher(
          key: ValueKey(counter),
          child: Text('$counter',
              style: const TextStyle(color: Colors.black, fontSize: 11)),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        ),
        SizedBox(
          width: 5,
          height: 5,
          child: FloatingActionButton(
            onPressed: incrementer,
            backgroundColor: greenColor,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
