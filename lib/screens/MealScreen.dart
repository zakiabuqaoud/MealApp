
import 'package:flutter/material.dart';

class MealScreen extends StatefulWidget {
  static String routeName = "/meal";

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final String categoryId = routeArgument['id'] as String;
    final String categoryTitle = routeArgument['title'] as String;
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: null,
    );
  }
}
