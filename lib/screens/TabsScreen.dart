import 'package:flutter/material.dart';
import 'package:meal_app/screens/CategoriesScreen.dart';
import 'package:meal_app/screens/FavoritesScreen.dart';

class TabsScreen extends StatefulWidget {

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {"page": CategoriesScreen(), "title": "Category"},
    {"page": const FavoritesScreen(), "title": "Your Favorites"}
  ];
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
              icon: Icon(Icons.category),
              label: "category"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Favorites"
            )
          ],
        ),
      ),
    );
  }
}
