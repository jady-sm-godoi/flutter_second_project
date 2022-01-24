import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal extends StatelessWidget {
  final String id;
  final List<String>? categories;
  final String? title;
  final String? imageUrl;
  final List<String>? ingredients;
  final List<String>? steps;
  final int? duration;
  final bool? isGlutenFree;
  final bool? isLactoseFree;
  final bool? isVegan;
  final bool? isVegetarian;
  final Complexity? complexity;
  final Cost? cost;

  const Meal({
    Key? key,
    required this.id,
    this.categories,
    this.title,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
    this.complexity,
    this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
