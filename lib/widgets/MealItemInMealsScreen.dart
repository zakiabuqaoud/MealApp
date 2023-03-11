import 'package:flutter/material.dart';

class MealItemInMealsScreen extends StatelessWidget {
  final complexity;
  final imageUrl;
  final title;
  final duration;
  final affordability;

  const MealItemInMealsScreen({required this.complexity, required this.imageUrl, required this.title, required this.duration, required this.affordability});

  void selectMeal(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Stack(
                children:<Widget> [
                   ClipRRect(
                     borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                      child: Image.network(imageUrl, width: double.infinity, height: 200,fit: BoxFit.cover,),
                  )
                ],
              ),
              Row(
                children: [
                  Row(),
                  Row(),
                  Row(),
                ],
              )
            ],
          ),
        ));
  }
}
