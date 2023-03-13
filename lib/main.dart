
import 'package:flutter/material.dart';
import './1.1%20dummy_data.dart';
import './models/Meal.dart';
import './screens/CategoriesScreen.dart';
import './screens/FilterScreen.dart';
import './screens/MealScreen.dart';
import './screens/MealDetails.dart';
import './screens/TabsScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filter = {
    "gluten":false,
    "lactose":false,
    "vegan":false,
    "vegetarian":false,
  };

  List<Meal> availableMeals= DUMMY_MEALS;

  void seveFilter(Map<String, bool> FiltersData){
    setState(() {
      _filter = FiltersData;
      availableMeals = DUMMY_MEALS.where((meal){

        if(_filter["gluten"]! && !meal.isGlutenFree){
          return false;
        }
        if(_filter["lactose"]! && !meal.isLactoseFree){
          return false;
        }
        if(_filter["vegan"]! && !meal.isVegan){
          return false;
        }
        if(_filter["vegetarian"]! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Raleway",
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
              fontSize: 24,
              fontFamily: "RobotoCondensed"
          )
        ),
      ),
      routes: {
        "/":(context) => TabsScreen(),
        CategoriesScreen.routeName : (context) => CategoriesScreen(),
        MealScreen.routeName: (context) => MealScreen(availableMeals),
        MealDetails.routeName: (context) => MealDetails(),
        FilterScreen.routeName:(context) => FilterScreen(seveFilter, _filter)

      },
    );
  }
}




