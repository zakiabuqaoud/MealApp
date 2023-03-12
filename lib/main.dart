import 'package:flutter/material.dart';
import 'package:meal_app/screens/CategoriesScreen.dart';
import 'package:meal_app/screens/FilterScreen.dart';
import 'package:meal_app/screens/MealScreen.dart';
import 'package:meal_app/screens/MealDetails.dart';
import 'package:meal_app/screens/TabsScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        MealScreen.routeName: (context) => MealScreen(),
        MealDetails.routeName: (context) => MealDetails(),
        FilterScreen.routeName:(context) => FilterScreen()

      },
    );
  }
}




