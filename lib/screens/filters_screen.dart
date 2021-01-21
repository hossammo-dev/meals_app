import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final String routeId = '/filters-screen';

  final Function updateFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.updateFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _lactoseFree;
  bool _vegetarian;
  bool _glutenFree;

  @override
  void initState() {
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _glutenFree = widget.currentFilters['gluten'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              final _currentSelectedFilters = {
                'lactose': _lactoseFree,
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
              };
              widget.updateFilters(_currentSelectedFilters);
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeId);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
                child: Text(
                  'Setup your meals settings..',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildSwitchTile(
                      title: 'Lactose-Free',
                      description: 'Include meals that have "Lactose-Free"',
                      currentValue: _lactoseFree,
                      updateValue: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      },
                    ),
                    _buildSwitchTile(
                      title: 'Gluten-Free',
                      description: 'Include meals that have "Gluten-Free"',
                      currentValue: _glutenFree,
                      updateValue: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      },
                    ),
                    _buildSwitchTile(
                      title: 'Vegeterian',
                      description: 'Include Only "Vegetarian" meals',
                      currentValue: _vegetarian,
                      updateValue: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSwitchTile(
      {String title,
      bool currentValue,
      String description,
      Function updateValue}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      // onChanged: (newValue){
      //   _updateValueSetting(currentValue, newValue);
      // },
      onChanged: updateValue,
    );
  }
}
