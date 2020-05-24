import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'weather_data.dart';

class HandleTapEvent {
  WeatherData _weatherData = new WeatherData();

  void handleTapEvent(LatLng latLng, BuildContext context) async {
    dynamic weather = await _weatherData.getLocationWeather(latLng);
    Provider.of<DataProvider>(context, listen: false).changeString(weather);
    final BottomNavigationBar navigationBar = globalKey.currentWidget;
    navigationBar.onTap(0);
  }
}
