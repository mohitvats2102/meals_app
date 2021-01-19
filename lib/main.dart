import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }

  void _toggleFav(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere(
      (meal) => meal.id == mealId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere(
            (meal) => meal.id == mealId,
          ),
        );
      });
    }
  }
  bool _isMealFav(String id){
    return _favoriteMeals.any((meal)=>meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.yellow,
        canvasColor: Colors
            .white, //Color.fromRGBO(255, 254, 229, 1), this canvascolor sets the color of background...
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CatrgoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFav,_isMealFav),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (setting){
      //     print(setting.name);
      //     return MaterialPageRoute(builder:(ctx)=>CatrgoriesScreen(),);
      // },
      onUnknownRoute: (setting) {
        //for this watch WebHD_720p (15)
        return MaterialPageRoute(
          builder: (ctx) => CatrgoriesScreen(),
        );
      }, //home has automatically named route,which is '/'..watch vedio 162).Diving Deeper into named routes
    );
  }
}
