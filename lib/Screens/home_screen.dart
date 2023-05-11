import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/search_results_screen.dart';
import 'package:healthfooddelivery/model/recipe.api.dart';
import 'package:healthfooddelivery/model/search_result_model.dart';
import 'package:healthfooddelivery/repositories/firestore_repo.dart';
import 'package:healthfooddelivery/Screens/food_info_screen.dart';
import 'package:healthfooddelivery/model/recipe_model.dart';
import 'package:healthfooddelivery/model/user_details_model.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/menu_widgets.dart';
import 'package:healthfooddelivery/widgets/recipe_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Recipe> _breakfastList;
  List<Recipe> _lunchList;
  List<Recipe> _dinnerList;
  List<Recipe> _snacksList;
  List<Recipe> _mealtimeList;
  RecipeApi recipeApi = RecipeApi();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);

    _loadFoodResults();
  }

  Future<void> _loadFoodResults() async {
    try {
      _breakfastList = await recipeApi.getFoodResults('breakfast');
      _lunchList = await recipeApi.getFoodResults('lunch');
      _dinnerList = await recipeApi.getFoodResults('dinner');
      _snacksList = await recipeApi.getFoodResults('snacks');
      _mealtimeList = await recipeApi.getFoodResults('mealtime');

      setState(() {});
    } catch (e) {
      print('Failed to load food results: $e');
    }
  }

  Firestore firestore = Firestore();
  TextEditingController searchController = TextEditingController();

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
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuWidget(),
                  FutureBuilder<UserDetailsModel>(
                    future: firestore.getUserNameAndAddress(),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserDetailsModel> snapshot) {
                      {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'montserrat',
                                    fontSize: 10),
                              ),
                              Text(
                                '${snapshot.data.address}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          );
                        } else {
                          return const Text('',
                              style: TextStyle(color: Colors.black));
                        }
                      }
                    },
                  ),
                  const Icon(Icons.notifications_outlined, color: Colors.black),
                ]),
            iconTheme: IconThemeData(color: Colors.black)),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FutureBuilder<UserDetailsModel>(
                                  future: firestore.getUserNameAndAddress(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<UserDetailsModel>
                                          snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        'Hi ${snapshot.data.name} !',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else {
                                      return const Text('',
                                          style:
                                              TextStyle(color: Colors.black));
                                    }
                                  }),
                              Icon(Icons.notifications_active_sharp,
                                  color: Colors.yellow)
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width>500?MediaQuery.of(context).size.width:300,
                            child: Text(
                              'As a new user you have access to 20 discount tickects and a free apointment with the nutritionist via audio or video call. \nStart Exploring!',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                //  fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ]),
                  )),
              const SizedBox(height: 20),
              SearchField(searchController: searchController),
              const SizedBox(height: 25),
              TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    color: greenColor, borderRadius: BorderRadius.circular(10)),
                tabs: [
                  Tab(
                    child: Container(
                      width: 100,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Breakfast')),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 0.4),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Lunch',
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.4)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Dinner'),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.4)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 100,
                      // ignore: sort_child_properties_last
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text('Snacks'),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.4)),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Mealtime'),
                      ),
                      decoration: BoxDecoration(
                          color: _tabController.index == 4
                              ? greenColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 0.4)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildFoodList(_breakfastList),
                    _buildFoodList(_lunchList),
                    _buildFoodList(_dinnerList),
                    _buildFoodList(_snacksList),
                    _buildFoodList(_mealtimeList),
                  ],
                ),
              ),
            ])));
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
    @required this.searchController,
  }) : super(key: key);

  final searchController;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isLoading = false;
  List<SearchResult> searchResults = [];
  RecipeApi recipeApi = RecipeApi();
  @override
  void initState() {
    super.initState();
    loadSearchResults();
  }

  Future<void> loadSearchResults() async {
    setState(() {
      isLoading = true;
    });
    final query = widget.searchController.text.trim();
    try {
      searchResults = await recipeApi.getSearchResults(query);
      setState(() {});
      if (searchResults.isNotEmpty) {
        String firstRecipeName = searchResults[0].name;
        print(firstRecipeName);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SearchResults(
                    results: searchResults, isLoading: isLoading)));
      } else {
        print('result is empty');
      }
    } catch (e) {
      print('Failed to load food results: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void dispose() {
    widget.searchController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
                width: 0.3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 3,
              ),
            ),
          ),
          onSubmitted: (value) => loadSearchResults(),
        ),
      ],
    );
  }
}

Widget _buildFoodList(List<Recipe> foodList) {
  if (foodList == null) {
    return const Center(child: CircularProgressIndicator());
  }

  if (foodList.isEmpty) {
    return const Center(child: Text('No food found.'));
  }
  return Flexible(
    fit: FlexFit.tight,
    child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: foodList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 250,
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) {
          Recipe recipe = foodList[index];

          return ListTile(
            title: RecipeCard(recipes:recipe ,
              title: foodList[index].name,
              cookTime: foodList[index].totalTime.toString(),
              calorie: foodList[index].calories.toString(),
              thumbnailUrl: foodList[index].imageUrl,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodInfoScreen(
                            recipes: recipe,
                          )));
            },
          );
        }),
  );
}
