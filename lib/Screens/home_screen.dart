import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/search_results_screen.dart';
import 'package:healthfooddelivery/model/product_model.dart';
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
    // UserDetailsModel userDetailsModel =
    //     Provider.of<UserDetailsProvider>(context).userDetails;
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
              //   StreamBuilder(
              // stream: firestore.getUserName(),
              // builder: (context, snapshots) {
              //   if (snapshots.hasData) {
              //     final name = snapshots.data;
              //     return Text("Hello ${name}",style: const TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: "montserrat"));
              //   }})
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
                const DefaultTabController(
                  length: 4,
                  child: TabBar(
                    tabs: [
                      Tab(child: Text("Breakfast", style: TextStyle())),
                      Tab(child: Text("Lunch", style: TextStyle())),
                      Tab(child: Text("Snacks", style: TextStyle())),
                      Tab(child: Text("Dinner", style: TextStyle())),
                    ],
                  ),
                ),
                TabBarView(children: [
                  GridFoodWidget(recipes: _recipes, topContainer: topContainer),
                  GridFoodWidget(recipes: _recipes, topContainer: topContainer),
                  GridFoodWidget(recipes: _recipes, topContainer: topContainer),
                  GridFoodWidget(recipes: _recipes, topContainer: topContainer),

                ])
              ],
            )));
  }
}

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    Key key,
    @required List<Recipe> recipes,
    @required this.topContainer,
  })  : _recipes = recipes,
        super(key: key);

  final List<Recipe> _recipes;
  final double topContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 5,

        //fit: FlexFit.loose,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1),
              itemCount: _recipes.length,
              //rphysics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Recipe recipe = _recipes[index];

                return Hero(
                  tag: _recipes[index],
                  child: ListTile(
                    title: RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodInfoScreen(
                                    recipes: recipe,
                                  )));
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class GridFoodWidget extends StatelessWidget {
  const GridFoodWidget({
    Key key,
    @required List<Recipe> recipes,
    @required this.topContainer,
  })  : _recipes = recipes,
        super(key: key);

  final List<Recipe> _recipes;
  final double topContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        flex: 5,

        //fit: FlexFit.loose,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: _recipes.length,
              //rphysics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Recipe recipe = _recipes[index];

                return Hero(
                  tag: _recipes[index],
                  child: ListTile(
                    title: RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodInfoScreen(
                                    recipes: recipe,
                                  )));
                    },
                  ),
                );
              }),
        ),
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
