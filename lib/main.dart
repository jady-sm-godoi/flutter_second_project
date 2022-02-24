import 'package:flutter/material.dart';
import 'package:udemy_recipe/models/settings.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';
import 'screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();

  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    this.settings = settings;

    setState(() {
      _availabelMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree!;
        final filterLacto = settings.isLactoseFree && !meal.isLactoseFree!;
        final filterVegan = settings.isVegan && !meal.isVegan!;
        final filterVege = settings.isVegetarian && !meal.isVegetarian!;

        return !filterVege && !filterVegan && !filterLacto && !filterGluten;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        // primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: const ColorScheme(
          primary: Colors.pink,
          primaryVariant: Colors.red,
          secondary: Colors.amber,
          secondaryVariant: Colors.brown,
          surface: Colors.grey,
          background: Colors.black,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.green,
          onBackground: Colors.white10,
          onError: Colors.redAccent,
          brightness: Brightness.light,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availabelMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
              isFavorite: _isFavorite,
              toggleFavorite: _toggleFavorite,
            ),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
    );
  }
}
