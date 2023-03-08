import 'dart:convert';

import 'package:healthfooddelivery/model/recipe_model.dart';
import 'package:healthfooddelivery/model/search_result_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "50", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-Key": "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32",
      "x-rapidapi-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }

  String appId = 'default-application_7000918';
  String appKey = "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32";
  Future<List<String>> searchFood(String query) async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/search',
        {"maxResult": "18", "start": "0", 'requirePictures': 'true',});
    String url = 'https://api.yummly.com/v1/api/recipes?q=$query';
    final Map<String, String> headers = {};
    // final Map<String, String> params = {
    //   'q': query,
    //   'start': '0',
    //   'maxResult': '10',
      
    //   '_app_id': appId,
    //   '_app_key': appKey,
    // };
   
       final response = await http.get(uri, headers: {
      "x-rapidapi-Key": "155a7056e3msh1a6d179b80d6b87p163334jsnd37cd9bfad32",
      "x-rapidapi-Host": "yummly2.p.rapidapi.com",
    //  "appID": 'default-application_7000918',
      "useQueryString": "true"
    });
   
      final data = json.decode(response.body);
      List matchingFoods = [];
      for (var i in data['matches']) {
        String foodName = i['recipeName'];
        matchingFoods.add(foodName);

        // return SearchResult.recipesFromSnapshot(matchingFoods);
      }
            return matchingFoods;
  }
}
