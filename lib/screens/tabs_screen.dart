import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static final String routeId = '/tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Categories', icon: Icon(Icons.category)),
              Tab(
                text: 'Favorites',
                icon: Icon(Icons.favorite),
              ),
            ],
            unselectedLabelColor: Colors.grey.shade800,
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            FavoritesScreen(),
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
