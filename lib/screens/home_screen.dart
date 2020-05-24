import 'package:flutter/material.dart';
import 'current_location_weather_screen.dart';
import 'list_screen.dart';
import 'map_screen.dart';

//Key to access bottom nav and its methods from other screens.
GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Ui constants
  int _selectedIndex = 0;

  //List of children widget to be displayed in the home page--body
  final List<Widget> _children = [
    CurrentLocationWeather(),
    MapPage(),
    ListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),

      // Add the children list to body, Used Indexed Stack to maintain state of the body.
      body: IndexedStack(
        children: _children,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: globalKey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('Weather'),
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

  //This handles tap on various icons on the bottom nav
  void _onItemTapped(int index) {
    print("Selected index --------$index");
    setState(() {
      _selectedIndex = index;
    });
  }
}
