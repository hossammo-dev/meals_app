import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/recipe_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'lactose': false,
    'gluten': false,
    'vegetarian': false,
  };

  List<Meal> _filteredMeals = DUMMY_MEALS;

  void _updateFilters(Map<String, bool> selectedFilters) {
    setState(() {
      _filters = selectedFilters;

      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 23.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: TabsScreen.routeId,
      routes: {
        TabsScreen.routeId: (ctx) => TabsScreen(),
        CategoryScreen.routeId: (ctx) => CategoryScreen(),
        RecipesScreen.routeId: (ctx) => RecipesScreen(_filteredMeals),
        MealDetails.routeId: (ctx) => MealDetails(),
        FavoritesScreen.routeId: (ctx) => FavoritesScreen(),
        FiltersScreen.routeId: (ctx) => FiltersScreen(_updateFilters, _filters),
      },
    );
  }
}
