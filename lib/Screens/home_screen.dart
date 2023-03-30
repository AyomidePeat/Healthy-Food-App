import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/search_results_screen.dart';
import 'package:healthfooddelivery/model/cart_model.dart';
import 'package:healthfooddelivery/providers/user_details_provider.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
//import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/Screens/food_info_screen.dart';

import 'package:healthfooddelivery/model/recipe_model.dart';
import 'package:healthfooddelivery/model/recipe.api.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/menu_widgets.dart';
import 'package:healthfooddelivery/widgets/recipe_card.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  // final UserDetailsModel user;
  // HomeScreen({@required this.user});
  // final ProductModel productModel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query;
  List<Recipe> _recipes;
  bool _isLoading = true;
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();

    getRecipes();

    controller.addListener(() {
      double value = controller.offset / 200;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  Firestore firestore = Firestore();
  TextEditingController searchController = TextEditingController();
  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              MenuWidget(),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Row(children: [
              const Icon(Icons.restaurant_menu, color: greenColor),
              const SizedBox(width: 10),
              FutureBuilder<UserDetailsModel>(
                future: firestore.getUserName(),
                builder: (BuildContext context,
                    AsyncSnapshot<UserDetailsModel> snapshot) {
                   {
                    if (snapshot.hasData) {
                      return Text(
                        'Hello ${snapshot.data.name}!',
                        style: TextStyle(color: Colors.black),
                      );
                    } else {
                      return const Text('Hello',
                          style: TextStyle(color: Colors.black));
                    }
                  }
                },
              ),
            ]),
            iconTheme: IconThemeData(color: Colors.black)),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SearchField(searchController: searchController),
                SizedBox(height: 15),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: greenColor))
                    : FoodWidget(recipes: _recipes, topContainer: topContainer),
              ],
            )));
  }
}

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    Key key,
    @required List<Recipe> recipes,
    @required this.topContainer,
  })  : recipees = recipes,
        super(key: key);

  final List<Recipe> recipees;
  final double topContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        // flex: 5,

        fit: FlexFit.tight,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: recipees.length,
            itemBuilder: (context, index) {
              Recipe recipe = recipees[index];

              return Hero(
                tag: recipees[index],
                child: ListTile(
                  title: RecipeCard(
                    title: recipees[index].name,
                    cookTime: recipees[index].totalTime,
                    rating: recipees[index].rating.toString(),
                    thumbnailUrl: recipees[index].images,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodInfoScreen(
                                  recipes: recipe, recipeTag: recipees,
                                )));
                  },
                ),
              );
            }),
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  SearchField({
    Key key,
    @required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  RecipeApi recipeApi = RecipeApi();

  List<String> _matchingFoods = [];
  void handleSubmitted(String value) async {
    List<String> matchingFoods = await recipeApi.searchFood(value);
    setState(() {
      _matchingFoods = matchingFoods;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SearchResults(matchingFoods: _matchingFoods)));
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) async {
                List<String> matchingFoods = await recipeApi.searchFood(value);
                setState(() {
                  _matchingFoods = matchingFoods;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SearchResults(matchingFoods: _matchingFoods)));
              },

              controller: widget.searchController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Search for the healthy food",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 0.4,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 0.5,
                  ),
                ),
              ),
              // keyboardType: TextInput,
            ),
          ],
        ));
  }
}
