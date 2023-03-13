import 'package:flutter/material.dart';

import '../widgets/MainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter";
  final Function saveFilter;
  final Map<String,bool> filters;
  FilterScreen(this.saveFilter, this.filters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFree = false;
  late bool _lactoseFree = false;
  late bool _vegan = false;
  late bool _vegetarian= false;

  @override
  void initState() {
    // TODO: implement initState
     _glutenFree = widget.filters["gluten"]!;
     _lactoseFree = widget.filters["lactose"]!;
     _vegan = widget.filters["vegan"]!;
     _vegetarian = widget.filters["vegetarian"]!;
    super.initState();
  }



  Widget createSwitchListTile(bool filter, String title, String subTitle, int num) {
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
            _vegetarian = newValue;
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
        actions: [
          IconButton(onPressed: (){
              final selectedFilter = {
                "gluten":_glutenFree,
                "lactose":_lactoseFree,
                "vegan":_vegan,
                "vegetarian":_vegetarian,
              };
              widget.saveFilter(selectedFilter);



            }, icon: Icon(Icons.save))
        ],
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
                  _vegan, "Vegan", "Only include vegan meals", 3),
              createSwitchListTile(_vegetarian, "Vegetarian",
                  "Only include vegatarian meals", 4),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
      drawerScrimColor: Theme.of(context).primaryColor.withOpacity(0.8),
    );
  }
}
