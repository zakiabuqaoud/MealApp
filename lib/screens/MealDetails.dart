import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal.dart';
import 'package:meal_app/1.1 dummy_data.dart';

class MealDetails extends StatelessWidget {
  static String routeName = "/meal_details";

  @override
  Widget build(BuildContext context) {
    final String mealId =
        ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => mealId== meal.id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            )
          ],
        ));
  }
}
