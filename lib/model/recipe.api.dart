import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthfooddelivery/model/recipe_model.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeApi {
  Future<List<Recipe>> getFoodResults(String mealType) async {
    String appId = '0fab63d1';
    String appKey = '2af892bf7c23f230b8ce6f0245b8d3b6';
    final response = await http.get(Uri.parse(
        'https://api.edamam.com/search?q=$mealType&app_id=$appId&app_key=$appKey'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final List<Recipe> foodResults = [];

      for (final item in jsonData['hits']) {
        final foodResult = Recipe.fromJson(item);
        foodResults.add(foodResult);
      }

      return foodResults;
    } else {
      throw Exception('Failed to load food results');
    }
  }
}
