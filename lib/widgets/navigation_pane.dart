import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/login_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';

class MenuStuff {
  final String title;
  final IconData icon;
  const MenuStuff(this.title, this.icon);
}

class MenuItems {
  static const home = MenuStuff('Home', Icons.home);
  static const appointments = MenuStuff('Appointments', Icons.calendar_month_outlined);
  static const guidelines = MenuStuff('Guidelines', Icons.list_alt_outlined);
  static const referAndEarn = MenuStuff('Refer And Earn', Icons.person_add);
  static const feedback = MenuStuff('Feedback', Icons.feedback);
  static const shareTransformation = MenuStuff('Share Transformation', Icons.add_a_photo);
  static const settings = MenuStuff('Settings', Icons.settings);
  static const connect = MenuStuff('Connect', Icons.cast_connected_outlined);
  static const cart = MenuStuff('Cart', Icons.shopping_cart_outlined);

  static const all = <MenuStuff>[
    home,
    appointments,
   guidelines,
    referAndEarn,
    feedback,
    shareTransformation,
    settings,
    connect,
    cart,
  ];
}

class NavigationPane extends StatelessWidget {
  final MenuStuff currentItem;
  final ValueChanged<MenuStuff> onSelectedItem;
  const NavigationPane({
    Key key,
    this.currentItem,
     this.onSelectedItem,
  }) ;
  @override
  Widget build(BuildContext context) => Theme(
   
        data: ThemeData.light(),
        child: Scaffold(
          
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
             
                               Spacer(),

                ...MenuItems.all.map(buildMenuItem).toList(),
             
                Spacer(flex: 2),
              ],
            ))),
      );
  Widget buildMenuItem(MenuStuff item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            onSelectedItem(item);
          },
        ),
      );
}
