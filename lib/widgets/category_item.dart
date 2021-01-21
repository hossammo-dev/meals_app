import 'package:flutter/material.dart';

import '../screens/recipe_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void _navigateToRecipesPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RecipesScreen.routeId, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToRecipesPage(context),
      borderRadius: BorderRadius.circular(15.0),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [color.withOpacity(0.4), color]),
          gradient: LinearGradient(colors: [color, Colors.white]),
          // color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title,
          style: ThemeData.light().textTheme.headline6,
        ),
      ),
    );
  }
}
