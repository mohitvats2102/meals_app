import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String text, IconData icon,Function onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 100,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Meal-Time!!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          _buildListTile(
            'Meals-Item',
            Icons.restaurant,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          Divider(
            color: Colors.black38,
          ),
          _buildListTile(
            'Settings',
            Icons.settings,
            (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),
           Divider(
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
