import 'package:flutter/material.dart';

import '../screens/FilterScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget createListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size:26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
      tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            height: 120,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          createListTile("Meal",  Icons.restaurant,(){Navigator.of(context).pushNamed("/");}),
          createListTile("Filters", Icons.settings,(){Navigator.of(context).pushNamed(FilterScreen.routeName);}),
        ],
      ),
    );
  }
}
