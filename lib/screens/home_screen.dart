import 'package:flutter/material.dart';
import 'list_screen.dart';
import 'map_screen.dart';
import 'current_location_weather_screen.dart';

//todo: 1-- add bottom nav
//todo: 2-- create different empty screens with container
//todo: 3-- add body in home returning different screens -- we will render different screens on home-body rather than navigating
//todo: 4-- work on map screen
//todo: 5-- work on list screen

//TODO: DIFFERENT-- how to centre align all appbar text in one line

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ui constants
  int _selectedIndex = 0;

  //List of children widget to be displayed in the home page body
  final List<Widget> _children = [
    CurrentLocationWeather(),
    MapPage(),
    ListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      // Add the children list to body
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Map'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    print("Selected index --------$index");
    setState(() {
      _selectedIndex = index;
    });
  }
}
