import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';
  final Function toggleFav;
  final Function isFavMeal;

  MealDetailScreen(
    this.toggleFav,
    this.isFavMeal,
  );

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 190,
      width: 390,
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final namedArgs = ModalRoute.of(context).settings.arguments;
    final mealId = namedArgs;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${index + 1}',
                        ),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      title: Text(
                        '${selectedMeal.steps[index]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavMeal(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          toggleFav(mealId);
        },
      ),
    );
  }
}
