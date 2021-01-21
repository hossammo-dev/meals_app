import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
// import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                'Meals App',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          SizedBox(height: 25),
          _buildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeId);
            },
          ),
          _buildListTile(
            title: 'Filters',
            icon: Icons.settings,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeId);
            },
          ),
        ],
      ),
    );
  }

  _buildListTile({String title, IconData icon, Function onTap}) {
    return ListTile(
      leading: Icon(icon, size: 25, color: Colors.grey),
      title: Text(
        '$title',
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
