import 'package:flutter/material.dart';
import '../screens/MealDetails.dart';

class MealItemInMealsScreen extends StatelessWidget {
  final String id;
  final complexity;
  final imageUrl;
  final title;
  final duration;
  final affordability;

  const MealItemInMealsScreen(
      {required this.id,
      required this.complexity,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.affordability});

  String get complexityText {
    switch (complexity.toString()) {
      case "Complexity.simple":
        return "Simple";
        break;
      case "Complexity.challenging":
        return "Challenging";
        break;
      case "Complexity.hard":
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability.toString()) {
      case "Affordability.affordable":
        return "Affordable";
        break;
      case "Affordability.pricey":
        return "Pricey";
        break;
      case "Affordability.luxurious":
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetails.routeName, arguments: id);
  }

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
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        color: Colors.black54,
                        width: 300,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 6),
                        Text("$duration min")
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(width: 6),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 6),
                        Text(affordabilityText)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
