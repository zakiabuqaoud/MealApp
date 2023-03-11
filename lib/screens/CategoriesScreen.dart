
import 'package:flutter/material.dart';
import 'package:meal_app/1.1%20dummy_data.dart';
import 'package:meal_app/widgets/CategoriesItem.dart';

//Home Page Group of Category
class CategoriesScreen extends StatelessWidget {
  static String routeName = "/categories";


  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: DUMMY_CATEGORIES.map((categoryData) => CategoriesItem(id: categoryData.id, title: categoryData.title, color: categoryData.color)).toList(),
      );
  }
}
