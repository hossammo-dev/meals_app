import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class RecipesScreen extends StatefulWidget {
  static final String routeId = '/recipe-screen';

  final List<Meal> filteredMeals;

  RecipesScreen(this.filteredMeals);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<Meal> _displayedMeals;
  String _mealTitle;

  _removeRecipe(String mealId) {
    setState(() {
      _displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    _mealTitle = routeArgs['title'];
    final _categoryId = routeArgs['id'];
    _displayedMeals = widget.filteredMeals
        .where((meal) => meal.categories.contains(_categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_mealTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, indx) {
          return MealItem(
            id: _displayedMeals[indx].id,
            title: _displayedMeals[indx].title,
            imageUrl: _displayedMeals[indx].imageUrl,
            affordability: _displayedMeals[indx].affordability,
            duration: _displayedMeals[indx].duration,
            complexity: _displayedMeals[indx].complexity,
            removeItem: _removeRecipe,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
