import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static final String routeId = '/meal-details';

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildSection({Widget child}) {
    return Container(
      // width: double.infinity,
      width: 300,
      height: 200,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_selectedMeal.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: _buildSectionTitle(context, 'Ingredients'),
            ),
            _buildSection(
              child: ListView.builder(
                itemBuilder: (context, indx) => Card(
                  margin: EdgeInsets.all(10),
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _selectedMeal.ingredients[indx],
                    ),
                  ),
                ),
                itemCount: _selectedMeal.ingredients.length,
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(vertical: 10),
              child: _buildSectionTitle(context, 'Steps'),
            ),
            _buildSection(
              child: ListView.builder(
                itemBuilder: (context, indx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text('${indx + 1}'),
                      ),
                      title: Text(_selectedMeal.steps[indx]),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
                itemCount: _selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(_mealId);
        },
        child: Icon(Icons.highlight_remove),
      ),
    );
  }
}
