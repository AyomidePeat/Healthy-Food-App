import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/Settings.dart';
import 'package:healthfooddelivery/Screens/favourite_screen.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/Screens/search_results_screen.dart';
import 'package:healthfooddelivery/model/favorite_model.dart';
class ScreenLayout extends StatefulWidget {
  const ScreenLayout();

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
   int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
    Widget getBodyWidget() {
    switch (currentIndex) {
      case 0:
        return NavigationScreen();
      case 1:
        return FavouriteScreen();

      case 2:
        return Settings();
    } 
    
  }
  Widget build(BuildContext context) {
   return CupertinoTabScaffold(
     
       tabBar:CupertinoTabBar(iconSize: 23,
        currentIndex: currentIndex,
       backgroundColor: Colors.transparent,
     activeColor: Colors.green,
    
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,  ),label:''),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp,), label: '',
            
          ),
        
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings, ), label:''),
        ],
      ), tabBuilder: (BuildContext context, int index) {  return CupertinoTabView(
          builder: (BuildContext context) => getBodyWidget(),
        ); },
    );
  }
}