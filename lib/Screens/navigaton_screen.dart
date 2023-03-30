import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:healthfooddelivery/Screens/Appointments_screen.dart';
import 'package:healthfooddelivery/Screens/Settings.dart';
import 'package:healthfooddelivery/Screens/cart_screen.dart';
import 'package:healthfooddelivery/Screens/feedback_screen.dart';
import 'package:healthfooddelivery/Screens/guidelines_screen.dart';
import 'package:healthfooddelivery/Screens/home_screen.dart';
import 'package:healthfooddelivery/Screens/refer_and_earn_screen.dart';
import 'package:healthfooddelivery/Screens/transformation_screen.dart';
import 'package:healthfooddelivery/widgets/navigation_pane.dart';

class NavigationScreen extends StatefulWidget {
  // NavigationScreen({.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return HomeScreen();
      case MenuItems.connect:
        return HomeScreen();
      case MenuItems.appointments:
        return AppointmentsScreen();
      case MenuItems.guidelines:
        return GuidelinesScreen();
      case MenuItems.referAndEarn:
        return ReferAndEarnScreen();
      case MenuItems.feedback:
        return FeedbackScreen();
      case MenuItems.shareTransformation:
        return TransformationScreen();
      case MenuItems.settings:
        return Settings();
      case MenuItems.cart:
        return CartScreen();
      default:
        return HomeScreen();
    }
  }

  MenuStuff currentItem = MenuItems.home;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ZoomDrawer(
      borderRadius: 40,
      angle: -10,
      style: DrawerStyle.style4,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      // slideHeight: MediaQuery.of(context).size.width * 0.8,
      showShadow: true,
      menuBackgroundColor: Colors.white,
      mainScreen: getScreen(),
      menuScreen: Builder(builder: (context) {
        return NavigationPane(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() => currentItem = item);
            ZoomDrawer.of(context).close();
          },
        );
      }),
    ));
  }
}
