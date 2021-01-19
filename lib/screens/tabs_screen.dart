import 'package:flutter/material.dart';
import '../models/meal.dart';

import './categories_screen.dart';
import './favorits_screen.dart';
import '../widget/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  TabsScreen(this.favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _slectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _slectedPageIndex = index;
    });
  }
  @override
  void initState() {
   _pages= [
    {
      'page': CatrgoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritsScreen(widget.favoriteMeal),
      'title': 'Your Favorites',
    },
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_slectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_slectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _slectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text(
                'Favorites',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
    );
    // return DefaultTabController(  //however,for this DefaultTabController we need Stateless widget
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('DeliMeals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favorits',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //     CatrgoriesScreen(),
    //      FavoritsScreen(),
    //     ]),
    //   ),
    // );
  }
}
