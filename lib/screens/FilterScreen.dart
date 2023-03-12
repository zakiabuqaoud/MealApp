import 'package:flutter/material.dart';

import '../widgets/MainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegatarian = false;

  Widget createSwitchListTile(
      bool filter, String title, String subTitle, int num) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: filter,
      onChanged: (newValue) {
        setState(() {
          if (num == 1) {
            _glutenFree = newValue;
          } else if (num == 2) {
            _lactoseFree = newValue;
          } else if (num == 3) {
            _vegan = newValue;
          } else if (num == 4) {
            _vegatarian = newValue;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              createSwitchListTile(_glutenFree, "Gluten-Free",
                  "Only include gluten-free meals", 1),
              createSwitchListTile(_lactoseFree, "Lactose-Free",
                  "Only include lactose-free meals", 2),
              createSwitchListTile(
                  _vegan, "Vegan-Free", "Only include vegan-free meals", 3),
              createSwitchListTile(_vegatarian, "Vegatarian-Free",
                  "Only include vegatarian-free meals", 4),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
      drawerScrimColor: Theme.of(context).primaryColor.withOpacity(0.8),
    );
  }
}
