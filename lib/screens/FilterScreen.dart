import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {

  static String routeName = "/filter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("filter"),),
      body: Center(
        child: Text("filter", style: TextStyle(
          fontSize: 40,
          color: Theme.of(context).primaryColor,
        ),),
      ),
    );
  }
}
