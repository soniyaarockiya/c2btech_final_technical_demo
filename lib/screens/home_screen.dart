import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/data_related/weather_pojo.dart';
import 'package:c2btechfinaltechnicaldemo/services/current_location_data_call.dart';
import 'package:c2btechfinaltechnicaldemo/services/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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

  WeatherData _weatherData = new WeatherData();
  CurrentLocation _currentLocation = new CurrentLocation();

  //List of children widget to be displayed in the home page--body
  final List<Widget> _children = [
    CurrentLocationWeather(),
    MapPage(),
    ListPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

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

  void getWeatherData(LatLng latLng) async {
    //get weather data
    Weather weather = await _weatherData.getLocationWeather(latLng);
    Provider.of<DataProvider>(context, listen: false).changeString(weather);
  }

  void getCurrentLocation() async {
    //Get current location lat and long
    Position _position = await _currentLocation.getLocation();

    LatLng latLng = LatLng(_position.latitude, _position.longitude);
    getWeatherData(latLng);
  }
}
