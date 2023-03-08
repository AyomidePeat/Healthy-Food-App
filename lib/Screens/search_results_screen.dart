import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/food_info_screen.dart';
import 'package:healthfooddelivery/model/search_result_model.dart';
import 'package:healthfooddelivery/widgets/recipe_card.dart';

class SearchResults extends StatefulWidget {
  final List<String> matchingFoods;
  const SearchResults({@required this.matchingFoods,key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
       return Expanded(
        child: ListView.builder(
            itemCount: widget.matchingFoods.length,
            itemBuilder: (BuildContext context, int index) {
          
              return ListTile(
                 title: Text(widget.matchingFoods[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodInfoScreen(
                                recipes: widget.matchingFoods,
                            )));
                },
              );
            }));
  }
}
