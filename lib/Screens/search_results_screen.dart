import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/food_info_screen.dart';

import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/model/recipe_model.dart';
import 'package:healthfooddelivery/model/search_result_model.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/recipe_card.dart';

class SearchResults extends StatefulWidget {
  final results;
  final isLoading;
  const SearchResults({@required this.results, this.isLoading, key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
               Text('${widget.results.length } results found',
                  style: TextStyle(
                      letterSpacing: 1.4,
                      color: greenColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserat')),
            ],
          ),
        ),
      body: Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Column(
        children: [
         
          Flexible(child: _buildResultList(widget.results)),
        ],
      ),
    ));
   
  }
}

Widget _buildResultList(List<SearchResult> resultList) {
  if (resultList == null) {
    return const Center(child: CircularProgressIndicator());
  }

  if (resultList.isEmpty) {
    return const Center(child: Text('No search results found.'));
  }
  return ListView.builder(
      //scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: resultList?.length ?? 0,
      itemBuilder: (context, index) {
        SearchResult results = resultList[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: resultList[index].imageUrl != null
                ? Image.network(resultList[index].imageUrl)
                : null,
            title: Text(resultList[index].name, style: TextStyle(fontFamily:'montserrat') ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodInfoScreen(
                            recipes: results,
                            // recipeTag: recipees,
                          )));
            },
          ),
        );
      });
}
