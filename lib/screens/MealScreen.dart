import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import 'package:meal_app/widgets/MealItemInMealsScreen.dart';
import '../1.1 dummy_data.dart';

// Group of Mails
class MealScreen extends StatefulWidget {
  static String routeName = "/meal";

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late List<Meal> meals;
  late String categoryTitle;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final String categoryId = routeArgument['id'] as String;
    categoryTitle = routeArgument['title'] as String;
    meals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItemInMealsScreen(id: meals[index].id,title: meals[index].title, imageUrl: meals[index].imageUrl, duration: meals[index].duration, complexity:meals[index].complexity, affordability: meals[index].affordability);
        },
        itemCount: meals.length,
      ),
    );
  }
}
