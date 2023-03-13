import 'package:flutter/material.dart';
import '../widgets/MealItemInMealsScreen.dart';
import '/models/Meal.dart';

class FavoritesScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);


  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text("You have no favorites yet - start adding some!",style: TextStyle(
          color: Colors.black,
        ),),
      );
    }else{
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItemInMealsScreen(id: widget.favoriteMeals[index].id,title: widget.favoriteMeals[index].title, imageUrl: widget.favoriteMeals[index].imageUrl, duration: widget.favoriteMeals[index].duration, complexity:widget.favoriteMeals[index].complexity, affordability: widget.favoriteMeals[index].affordability);
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
