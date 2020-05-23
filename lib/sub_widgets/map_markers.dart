import 'package:c2btechfinaltechnicaldemo/data_related/city_pojo.dart';
import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/screens/home_screen.dart';
import 'package:c2btechfinaltechnicaldemo/services/weather_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapMarkers {
  //Get city data along with coordinates and add them to markers set
  Set<Marker> _markers = Set<Marker>();
  WeatherData _weatherData = new WeatherData();

  Set<Marker> setMarkers(BuildContext context) {
    for (City city in cityDetails) {
      _markers.add(new Marker(
        markerId: MarkerId(city.cityName),
        position: LatLng(city.lat, city.lang),
        icon: BitmapDescriptor.defaultMarker,
        //handle tap on markers
        onTap: () {
          handleTapEvent(LatLng(city.lat, city.lang), context);
        },
        infoWindow: InfoWindow(title: city.cityName),
      ));
    }
    return _markers;
  }

  //Retrieve weather data for the tapped marker and display the details
  // on the home screen where current location data was displayed.
  void handleTapEvent(LatLng latLng, BuildContext context) async {
    dynamic weather = await _weatherData.getLocationWeather(latLng);
    Provider.of<DataProvider>(context, listen: false).changeString(weather);
//    Navigator.pushNamed(context, '/');
    final BottomNavigationBar navigationBar = globalKey.currentWidget;
    navigationBar.onTap(0);
  }
}
