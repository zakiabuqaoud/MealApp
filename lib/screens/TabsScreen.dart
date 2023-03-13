import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import '../screens/CategoriesScreen.dart';
import '../screens/FavoritesScreen.dart';
import '../widgets/MainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> FavoriteMeal;

  const TabsScreen(this.FavoriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> pages;

  @override
  void initState() {
    // TODO: implement initState
    pages = [
      {"page": CategoriesScreen(), "title": "Category"},
      {"page": FavoritesScreen(widget.FavoriteMeal), "title": "Your Favorites"}
    ];
    super.initState();
  }

  int selectTabIndex = 0;

  void selectTab(int value) {
    setState(() {
      selectTabIndex = value;
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[selectTabIndex]["title"] as String),
        ),
        body: pages[selectTabIndex]["page"] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: selectTabIndex,
          onTap: selectTab,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "category"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ],
        ),
        drawer: MainDrawer(),
        drawerScrimColor: Theme.of(context).primaryColor.withOpacity(0.8),
      ),
    );
  }
}
