import 'package:c2btechfinaltechnicaldemo/data_related/data_provider.dart';
import 'package:c2btechfinaltechnicaldemo/sub_widgets/card_view.dart';
import 'package:c2btechfinaltechnicaldemo/services/current_location_data_call.dart';
import 'package:c2btechfinaltechnicaldemo/services/weather_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:c2btechfinaltechnicaldemo/data_related/weather_pojo.dart';

class CurrentLocationWeather extends StatefulWidget {
  @override
  _CurrentLocationWeatherState createState() => _CurrentLocationWeatherState();
}

class _CurrentLocationWeatherState extends State<CurrentLocationWeather> {
  WeatherData _weatherData = new WeatherData();
  CurrentLocation _currentLocation = new CurrentLocation();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //CardView is implemented in sub widgets folder
      child: loading == true
          ? CupertinoActivityIndicator()
          : CardView(
              name: Provider.of<DataProvider>(context).cityName,
              country: Provider.of<DataProvider>(context).countryName,
              temperature: Provider.of<DataProvider>(context).temperature,
              weatherIcon: Provider.of<DataProvider>(context).weatherIcon,
              weatherDescription:
        Provider
            .of<DataProvider>(context)
            .weatherDescription,
      ),
    );
  }

  void getCurrentLocation() async {
    //Get current location lat and long
    Position _position = await _currentLocation.getLocation();
    LatLng latLng = LatLng(_position.latitude, _position.longitude);
    getWeatherData(latLng);
  }

  void getWeatherData(LatLng latLng) async {
    //get weather data
    Weather weather = await _weatherData.getLocationWeather(latLng);

    Provider.of<DataProvider>(context, listen: false).changeString(weather);

    setState(() {
      loading = false;
    });
  }
}
