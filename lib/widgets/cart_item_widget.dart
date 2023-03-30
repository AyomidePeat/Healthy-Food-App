import 'package:flutter/material.dart';

import 'package:healthfooddelivery/widgets/color.dart';

class CartItemWidget extends StatefulWidget {
  // final ProductModel product;
  final String thumbnailUrl;
  final String title;
  final int cost;
  const CartItemWidget({key, this.thumbnailUrl, this.title, this.cost});

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
    setState(() { if (counter > 0)
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonSize = 20;
    return SizedBox(
      height: 100,
      width: size.width * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(widget.thumbnailUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 8, left : 8,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 180, 
                  child: Text(widget.title, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      )),
                ),
                Text('\$ ${widget.cost.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.w700,
                      color: greenColor,
                      fontSize: 13,
                    )),
              ],
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 23.0),
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: FloatingActionButton(
                onPressed: decrementer,
                backgroundColor: greenColor,
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 27.0),
            child: AnimatedSwitcher(
              key: ValueKey(counter),
              child: Text('$counter',
                  style: const TextStyle(color: Colors.black, fontSize: 11, fontWeight:  FontWeight.bold, )),
              transitionBuilder: (Widget child, Animation<double> animation) {
                
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              duration: Duration(milliseconds: 5000),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 23.0),
            child: SizedBox(
              width: buttonSize,
              height: buttonSize,
              child: FloatingActionButton(
                onPressed: incrementer,
                backgroundColor: greenColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
