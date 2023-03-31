import 'package:flutter/material.dart';

//import 'package:healthfooddelivery/model/recipe.api.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String calorie;
  final String cookTime;
  final String thumbnailUrl;
  RecipeCard({
    @required this.title,
    @required this.cookTime,
    @required this.calorie,
    @required this.thumbnailUrl,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isPressed = false;

  void favButton() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        //  width: 70,
        height: 300,
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(widget.thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    favButton();
                  },
                  icon: Icon(isPressed ? Icons.favorite : Icons.favorite_border,
                      color: isPressed ? greenColor : Colors.white)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$20',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: greenColor,
                                  fontSize: 16)),
                          SizedBox(width: 7),
                          Text('${widget.calorie} Cal | ${widget.cookTime} mins',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
