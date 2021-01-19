import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritsScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoritsScreen(
    this.favoriteMeal,
  );
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('You Havn\'t Chosed Favorits Yet-Start Adding Some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
